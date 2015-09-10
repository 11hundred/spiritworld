class AddDefaultValueToPostsPublished < ActiveRecord::Migration
  def change
    change_column :posts, :published, :boolean, :default => false
  end
end
