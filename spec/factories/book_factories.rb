require 'factory_bot'
FactoryBot.define do
  factory :book do
    title { 'xyz' }
    category{'educational'}
    published_date{02-02-2023}  
    quantity{3}  
    rent{200}
    author  
    publisher
  end
end 