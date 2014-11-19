# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    sequence(:title) {|i| "hoge#{i}"}
    sequence(:body) {|i| "fuga#{i}"}
  end
end
