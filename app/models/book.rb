class Book < ApplicationRecord
  has_one_attached :cover
  belongs_to :author
  belongs_to :publisher

  has_many :borrowings , dependent: :destroy
  has_many :borrowers, through: :borrowings, source: :user

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations, source: :user

validates :title, presence: true
validates :category, presence: true  
validates :published_date, presence: true 
validates :quantity, presence: true 
validates :rent, presence: true 
  
  
  
  def self.available?(book)
    if book.quantity > 0
      true
    else
      false
    end
  end

  def self.isBorrovable?(book,current_user)
    # @book = Book.find(params[:book_id])
    borrowing = Borrowing.where(user_id: current_user, book_id: book.id).last

    unless borrowing.nil?
      # byebug
      if borrowing.status == "returned"
        true
      else
        false
      end
    else
      true
    end
  end

end
