module Refinery
  module Downloads
    module Admin
      class DownloadsController < ::Refinery::AdminController

        crudify :'refinery/downloads/download',
                :title_attribute => 'categoy',
                :xhr_paging => true

      end
    end
  end
end
