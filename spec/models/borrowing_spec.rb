require 'rails_helper'
RSpec.describe Borrowing, type: :model do

  describe "Association for borrowing" do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
    it { should have_many(:fines) }
  end
end
  # belongs_to :user
  # belongs_to :book

  # has_many :fines