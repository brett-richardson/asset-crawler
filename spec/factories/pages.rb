# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    domain
    sequence( :title ){ |n| "Page Title #{n}" }
  end
end
