class CreateDownloadsDownloads < ActiveRecord::Migration

  def up
    create_table :refinery_downloads do |t|
      t.string :categoy
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-downloads"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/downloads/downloads"})
    end

    drop_table :refinery_downloads

  end

end
