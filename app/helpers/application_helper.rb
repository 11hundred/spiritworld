module ApplicationHelper

  def sitename
    'The Spiritworld'
  end

	def sitedescription
		''
	end

  def sitepodcastimage
    'http://images.askmen.com/1080x540/news/fine_living/jack-daniel-s-tennessee-whiskey-law-1092042-TwoByOne.jpg'
  end

  def post_event_content_types
		[
			['Link', 'link'],
			['Text', 'text'],
			['Image', 'image'],
			['YouTube Video', 'video_youtube']
		]
	end

end
