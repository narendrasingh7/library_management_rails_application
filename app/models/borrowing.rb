class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  has_many :fines

end
