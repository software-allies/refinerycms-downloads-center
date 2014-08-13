class CreateCategoriesSubcategories < ActiveRecord::Migration

  def up
    create_table :refinery_categories_subcategories do |t|
      t.string :title
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-categories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/categories/subcategories"})
    end

    drop_table :refinery_categories_subcategories

  end

end
