# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    domain
    path   '/assets/application.css'
  end
end
