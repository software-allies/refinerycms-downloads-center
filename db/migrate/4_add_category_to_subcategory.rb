class AddCategoryToSubcategory < ActiveRecord::Migration

  def up
    add_column :refinery_categories_subcategories, :category_id, :integer
  end

  def down
    remove_column :refinery_categories_subcategories, :category_id, :integer
  end

end
