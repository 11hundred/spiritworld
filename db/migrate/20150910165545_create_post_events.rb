class CreatePostEvents < ActiveRecord::Migration
  def change
    create_table :post_events do |t|
      t.references :post, index: true, foreign_key: true
      t.string :type
      t.string :url
      t.text :content
      t.integer :time_start
      t.integer :time_end

      t.timestamps null: false
    end
  end
end
