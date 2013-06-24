FactoryGirl.define do

  # sequence :email do |n|
  #   "email+#{n}@example.com"
  # end

  factory :user do
    name "Bob Smith"
    email "bob@example.com"
    password "password"
    password_confirmation "password"
  end
end