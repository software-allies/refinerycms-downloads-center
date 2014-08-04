
FactoryGirl.define do
  factory :download, :class => Refinery::Downloads::Download do
    sequence(:categoy) { |n| "refinery#{n}" }
  end
end

