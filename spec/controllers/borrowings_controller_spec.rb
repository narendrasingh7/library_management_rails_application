require 'rails_helper'

RSpec.describe BorrowingsController, type: :controller do
    
  let(:book)      {create(:book)}
  # let(:user)      {create(:user)}
  let(:borrowing) { create(:borrowing, book: book) }
  # byebug

  describe "Get #index" do
    context "success" do
      login_user
      it "index" do
        get :index
        expect(response).to be_successful
      end
      it "renders the :index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end
    context "Fails" do
      it "index" do
        # @author = Author.create(name:"sumit") 
        get :index
        expect(response).to_not be_successful
      end
    end
  end


  describe "Get #show" do
    login_user
    it 'respose to be succusseful #show ' do
      # byebug
      param = FactoryBot.attributes_for(:borrowing)
      get :show,  params: {id: borrowing.to_param}
      expect(response).to be_successful
    end

    it "renders the :show view" do
      # byebug
      get :show, params: {id: borrowing.to_param}
      expect(response).to render_template(:show)
    end   
  end

  describe "Get #edit" do
    login_user
    # let(:author) { create(:author) }
    it 'respose to be succusseful #edit ' do
      # byebug
      get :edit,  params: {id: borrowing.to_param}
      expect(response).to be_successful
    end
    
    it "renders the :edit view" do
    # byebug
    get :edit, params: {id: borrowing.to_param}
    expect(response).to render_template(:edit)
    end
  end

  describe "Get #new" do
    login_user
      it '#new instance @borrowing' do
        get :new
        expect(assigns(:borrowing)).to be_instance_of(Borrowing)
      end

      it "renders the :new view" do
        get :new
        expect(response).to render_template(:new)
      end
  end

  # describe "Post #create" do

  #   context "success" do
  #     login_user
  #     it "adds new borrowing to db" do
  #       borrowing_attributes = FactoryBot.attributes_for(:borrowing,book: book)
  #       byebug
  #       expect {
  #         post :create, params: { borrowing: borrowing_attributes }
  #       }.to change(Borrowing, :count).by(1)
  #     end

  #     # it "should redirect to the new page author#show" do
        
  #     #   author_attributes = FactoryBot.attributes_for(:author)
  #     #   post :create , params: { author: author_attributes}
  #     #   expect(response).to redirect_to(Author.last)
  #     # end

  #   end

#     context "Invalid attiributes" do

#       it "does not create a new record" do
#         expect { 
#           post :create, params: { author: {name: '' } }
#         }.to_not change(Author, :count)
#       end

#       it "should render to the new page again " do
        
#         post :create , params: { author:{name: ''}}
#         expect(response).to render_template(:new)
#       end

#     end
  # end
# #-------------------------------------------------------------------------------------------------
#   describe "Patch #update" do

#     context "success" do
      

#       it "Update author to db" do
#         # byebug
#         put :update ,params: {id: author.id ,author: {name: "Narendra"}}
#         expect(author.reload.name).to eq("Narendra")
        
#       end

#       # it "should redirect to the new page author#show" do
        
#       #   put :update ,params: {d: author.id ,author: {name: "Narendra"}}
#       #   expect(response).to render_template(auhtor.id)
#       # end

#     end
#     context "fails" do
      

#       it "can't Update author to db" do
#         # byebug
#         put :update ,params: {id: author.id ,author: {name: nil}}
#         expect(response).to render_template(:new)
        
#       end

#       # it "should redirect to the new page author#show" do
        
#       #   put :update ,params: {d: author.id ,author: {name: "Narendra"}}
#       #   expect(response).to redirect_to(:show)
#       # end

#     end
#   end
# #---------------------------------------------------------------------------------------------------------------
#   describe "Delete #destroy" do
#     it 'respose to be succusseful  #destroy' do
#       expect{
#         delete :destroy,  params: {id: author.to_param}
#       }
#     end

#     it "renders the :index view" do
#       # byebug
#       get :index, params: {id: author.to_param}
#       expect(response).to render_template(:index)
#     end   
#   end
end







