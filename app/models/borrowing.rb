class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :fines

  enum status: { approved: 'approved', not_approved: 'not_approved', returned: 'returned' }

  # def self.issued?
  #   if Borrowing.status == "approved"
  # end
end
