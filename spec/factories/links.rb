# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    domain
    source factory: :page
    path   '/user'
  end
end
