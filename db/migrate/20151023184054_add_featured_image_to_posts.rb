class AddFeaturedImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_image, :string
  end
end
