require 'rails_helper'
RSpec.describe Book, type: :model do

  describe "Validations for Book model" do 
    # byebug 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:published_date) }
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:rent) }
    # it { should validate_presence_of(:author_id) }
    # it { should validate_presence_of(:publisher_id) }
  end

  describe "Association" do
    it { should belong_to(:publisher) }
    it { should belong_to(:author) }
    it { is_expected.to have_many(:borrowings).dependent(:destroy)}
    it { should have_many(:borrowers).through(:borrowings) }
    it { is_expected.to have_many(:reservations).dependent(:destroy)}
    it { should have_many(:users).through(:reservations) }
  end

end
  