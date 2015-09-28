class Post < ActiveRecord::Base

  has_many :post_events, :dependent => :destroy

  default_scope { order('publish_timestamp DESC') }
  scope :published, -> { where(:published => true) }
  scope :unpublished, -> { where(:published => false) }

end
