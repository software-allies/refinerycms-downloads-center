module Refinery
  module Categories
    module Admin
      class SubcategoriesController < ::Refinery::AdminController

        crudify :'refinery/categories/subcategory', :xhr_paging => true

      end
    end
  end
end
