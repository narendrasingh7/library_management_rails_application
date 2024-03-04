class Book < ApplicationRecord
  has_one_attached :cover
  belongs_to :author
  belongs_to :publisher

  has_many :borrowings #, dependent: :destroy
  has_many :borrowers, through: :borrowings, source: :user

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
  
  
  
  def self.available?(book)
    if book.quantity > 0
      true
    else
      false
    end
  end

  def self.isBorrovable?(book,current_user)
    # @book = Book.find(params[:book_id])
    if Borrowing.find_by(user_id: current_user, book_id: book.id)
      false
    else
      true
    end
  end
end
