require 'rails_helper'
RSpec.describe User, type: :model do

  describe "Association for user model" do
    it { is_expected.to have_many(:borrowings).dependent(:destroy)}
    it { should have_many(:borrowed_books).through(:borrowings) }
    it { is_expected.to have_many(:reservations).dependent(:destroy)}
    it { is_expected.to have_many(:resurved_books).through(:reservations) }
  end

end
