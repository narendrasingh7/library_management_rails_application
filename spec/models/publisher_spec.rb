require 'rails_helper'

RSpec.describe Publisher, type: :model do

  describe "Validations for publisher model"  do
    it {should validate_presence_of(:name)}
  end

  describe "Association"  do
    it {is_expected.to have_many(:books).dependent(:destroy)}
  end


end