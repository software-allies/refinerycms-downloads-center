module Refinery
  module Categories
    class Subcategory < Refinery::Core::BaseModel

      attr_accessible :title, :description, :position, :category_id

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :category
      has_many :downloads
    end
  end
end
