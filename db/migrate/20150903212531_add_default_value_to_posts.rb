class AddDefaultValueToPosts < ActiveRecord::Migration
  def change
    change_column :posts, :is_podcast, :boolean, :default => false
    change_column :posts, :show_notes_match_content, :boolean, :default => true
  end
end
