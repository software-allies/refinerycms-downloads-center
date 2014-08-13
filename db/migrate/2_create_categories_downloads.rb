class CreateCategoriesDownloads < ActiveRecord::Migration

  def up
    create_table :refinery_categories_downloads do |t|
      t.string :title
      t.text :description
      t.integer :picture_id
      t.integer :file_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-categories"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/categories/downloads"})
    end

    drop_table :refinery_categories_downloads

  end

end
