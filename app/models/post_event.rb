class PostEvent < ActiveRecord::Base
  belongs_to :post

  validates :time_start, :time_end, :content_type, :presence => true
  validates :content, :presence => true, if: "url.nil?"

  default_scope { order('time_start ASC') }

  def youtube_video_id
    if self.content_type == 'video_youtube'
      self.url.scan(/^.*(youtu.be\/|v\/|embed\/|watch\?|youtube.com\/user\/[^#]*#([^\/]*?\/)*)\??v?=?([^#\&\?]*).*/)[0][2]
    else
      false
    end
  end

end
