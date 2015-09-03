class AddAudioFileUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :audio_file_url, :string
  end
end
