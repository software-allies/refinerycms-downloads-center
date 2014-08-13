
FactoryGirl.define do
  factory :download, :class => Refinery::Categories::Download do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

