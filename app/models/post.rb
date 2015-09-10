class Post < ActiveRecord::Base

  default_scope { order('publish_timestamp DESC') }
  scope :published, -> { where(:published => true) }
  scope :unpublished, -> { where(:published => false) }

end
