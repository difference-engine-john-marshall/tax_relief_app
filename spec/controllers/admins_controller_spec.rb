require 'rails_helper'

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

RSpec.describe AdminsController, type: :controller do

  describe "create" do
    context "admin is logged in" do
      login_admin

      it 'should create a new admin' do 
        expect{
          post :create, {email: "test@example.com"}
        }.to change(Admin, :count).by(1)
      end

      it 'should redirect to root path if email is provided' do
        post :create, {email: "test@example.com"}
        expect(response).to redirect_to(root_path)
      end

      it 'should render new if admin is not valid' do
        post :create
        expect(response).to render_template(:new)
      end
    end 

    context "admin is NOT logged in" do
      it 'should not create a new admin' do
        expect{
          post :create, {email: "test@example.com"}
        }.to change(Admin, :count).by(0)
      end

    end
  end
  

end
