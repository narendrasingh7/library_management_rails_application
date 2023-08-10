require 'factory_bot'

FactoryBot.define do
  factory :borrowing do
    issue_date { Date.today }
    due_date {Date.today + 15.days}
    returned_date {nil}
    user_id{1}
    # book_id{1}
    association :book
    # association :user
  end
end 