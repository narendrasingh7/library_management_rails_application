class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher

  has_many :borrowings #, dependent: :destroy
  has_many :borrowers, through: :borrowings, source: :user

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

end
