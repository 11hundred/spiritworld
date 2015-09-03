class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :is_podcast
      t.integer :episode_id
      t.boolean :show_notes_match_content
      t.text :show_notes

      t.timestamps null: false
    end
  end
end
