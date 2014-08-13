class AddSubcategoryToDownload < ActiveRecord::Migration

  def up
    add_column :refinery_categories_downloads, :subcategory_id, :integer
  end

  def down
    remove_column :refinery_categories_downloads ,:subcategory_id
  end

end
