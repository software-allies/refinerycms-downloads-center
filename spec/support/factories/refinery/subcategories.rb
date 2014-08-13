
FactoryGirl.define do
  factory :subcategory, :class => Refinery::Categories::Subcategory do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

