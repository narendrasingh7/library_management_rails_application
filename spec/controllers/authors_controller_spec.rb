require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe "permitted status" do
    it "index" do
      @author = Author.create(name:"sumit") 
      get :index
      expect(response).to be_successful
    end
  end
end








