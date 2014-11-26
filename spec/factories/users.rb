# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    nickname "MyString"
    password_digest "MyString"
    first_name "MyString"
    last_name "MyString"
  end
end
