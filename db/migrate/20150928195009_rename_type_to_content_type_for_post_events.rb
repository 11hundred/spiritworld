class RenameTypeToContentTypeForPostEvents < ActiveRecord::Migration
  def change
    rename_column :post_events, :type, :content_type
  end
end
