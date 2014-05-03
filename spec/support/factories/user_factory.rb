FactoryGirl.define do
  factory :user, :class => Subscribem::User do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"
    password_confirmation { |u| u.password }
  end
end
