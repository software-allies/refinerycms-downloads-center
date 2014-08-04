module Refinery
  module Downloads
    class Download < Refinery::Core::BaseModel
      self.table_name = 'refinery_downloads'

      attr_accessible :categoy, :description, :position

      validates :categoy, :presence => true, :uniqueness => true
    end
  end
end
