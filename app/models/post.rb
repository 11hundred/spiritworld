class Post < ActiveRecord::Base

  default_scope { order('publish_timestamp DESC') }

end
