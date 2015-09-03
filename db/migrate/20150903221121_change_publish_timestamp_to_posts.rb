class ChangePublishTimestampToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :publish_timestamp, :timestamp, :null => false
  end
end
