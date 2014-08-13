module Refinery
  module Categories
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Categories

      engine_name :refinery_categories

      initializer "register refinerycms_subcategories plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "subcategories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.categories_admin_subcategories_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/categories/subcategory'
          }
          plugin.menu_match = %r{refinery/categories/subcategories(/.*)?$}
          plugin.hide_from_menu = true 
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Subcategories)
      end
    end
  end
end
