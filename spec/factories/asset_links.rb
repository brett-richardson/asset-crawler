# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset_link do
    source factory: :page
    path   '/assets/application.css'
    domain
  end
end
