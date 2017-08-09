FactoryGirl.define do
  sequence(:name) { |n| "R2D#{n}" }

  factory :user do
    name 
  end
end

