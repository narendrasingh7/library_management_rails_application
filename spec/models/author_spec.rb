require 'rails_helper'
# require 'shoulda/matchers'

RSpec.describe Author, type: :model do
  
  describe "Validations for author model" do 
    # byebug 
    it { should validate_presence_of(:name) }
  end

  describe "Association" do
    it { is_expected.to have_many(:books).dependent(:destroy)}
  end
end
