class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # after_create :send_welcome_email
  has_one_attached :avatar
  has_many :borrowings , dependent: :destroy
  has_many :borrowed_books, through: :borrowings, source: :book

  has_many :reservations, dependent: :destroy
  has_many :resurved_books, through: :reservations, source: :book

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

  # private
  # def send_welcome_email
  #     UserMailer.welcome_email(self).deliver_now
  # end
end
