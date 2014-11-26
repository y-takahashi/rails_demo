# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:nickname) {|i| "nickname#{i}"}
    sequence(:first_name) {|i| "first_name#{i}"}
    sequence(:last_name) {|i| "last_name#{i}"}
    password 'password'
  end
end
