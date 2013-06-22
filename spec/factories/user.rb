FactoryGirl.define do
  factory :user do
    name "Bob Smith"
    email "bob@example.com"
    password "password"
    password_confirmation "password"
  end
end