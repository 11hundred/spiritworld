class AddPublishTimestampToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :publish_timestamp, :timestamp, :default => Time.now
  end
end
