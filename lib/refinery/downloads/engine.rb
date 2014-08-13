module Refinery
  module Categories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Categories

      engine_name :refinery_categories

      initializer "register refinerycms_downloads plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "downloads"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.categories_admin_downloads_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/categories/download'
          }
          plugin.menu_match = %r{refinery/categories/downloads(/.*)?$}
           plugin.hide_from_menu = true 
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Downloads)
      end
    end
  end
end
