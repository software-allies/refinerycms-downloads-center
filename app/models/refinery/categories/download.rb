module Refinery
  module Categories
    class Download < Refinery::Core::BaseModel

      attr_accessible :title, :description, :picture_id, :file_id, :position, :subcategory_id

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      validates :subcategory_id, :presence => true

      belongs_to :picture, :class_name => '::Refinery::Image'

      belongs_to :file, :class_name => '::Refinery::Resource'

      belongs_to :subcategory

    end
  end
end
