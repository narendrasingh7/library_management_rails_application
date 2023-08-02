class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :avatar
  has_many :borrowings #, dependent: :destroy
  has_many :borrowed_books, through: :borrowings, source: :book

  has_many :reservations, dependent: :destroy
  has_many :books, through: :reservations

  has_many :fines

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #-------------------------------------------------------------------------------------------------
  # def admin?
  #   user_type == 'admin'
  # end

  def librarian?
    user_type == 'librarian'
  end

end
