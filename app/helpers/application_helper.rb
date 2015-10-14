module ApplicationHelper

  def sitename
    'The Spiritworld'
  end

	def sitedescription
		''
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
