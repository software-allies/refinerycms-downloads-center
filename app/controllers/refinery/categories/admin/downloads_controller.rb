module Refinery
  module Categories
    module Admin
      class DownloadsController < ::Refinery::AdminController

        crudify :'refinery/categories/download', :xhr_paging => true

      end
    end
  end
end
