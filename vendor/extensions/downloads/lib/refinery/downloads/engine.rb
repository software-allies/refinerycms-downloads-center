module Refinery
  module Downloads
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Downloads

      engine_name :refinery_downloads

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "downloads"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.downloads_admin_downloads_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/downloads/download',
            :title => 'categoy'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Downloads)
      end
    end
  end
end
