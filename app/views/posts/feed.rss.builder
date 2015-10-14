if params[:all] == 'true'
  @post_list = @posts
else
  @post_list = @posts.published.where(:is_podcast => true)
end

xml.instruct! :xml, :version => '1.0'
xml.rss :version => '2.0' do
  xml.channel do
    xml.title sitename
    xml.description sitedescription
    xml.link root_url
    xml.language 'en'

    xml.itunes :author, sitename
    xml.itunes :summary, sitedescription
    xml.itunes :explicit, 'no'

    for post in @post_list
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ''
        end
        xml.author sitename
        xml.pubDate post.publish_timestamp.to_s(:rfc822)
        xml.link root_url.gsub(/\/+$/, '') + post_path(post.id)
        if post.show_notes_match_content?
          xml.description post.content
        else
          xml.description post.content + '<br><br>' + post.show_notes
        end
        if post.is_podcast
          xml.itunes :explicit, 'no'
          xml.enclosure('url' => post.audio_file_url)
        end
      end
    end

  end
end
