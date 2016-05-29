require 'rails_helper'

#admin.rb currently setting superadmin as true, need to make one that sets as false to test regular admin
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:admin)
    end
  end

  def login_superadmin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryGirl.create(:superadmin)
    end
  end

  RSpec.describe AdminsController, type: :controller do

    describe "create" do
      context 'superadmin is logged in' do
        login_superadmin

        it 'should create a new admin' do 
          expect{
            post :create, {email: "test@example.com"}
          }.to change(Admin, :count).by(1)
        end

        it 'should delete an admin' do
          @admin = FactoryGirl.create(:admin, email: "test@example.com")
          expect{
            delete :destroy, {id: @admin.id}
          }.to change(Admin, :count).by(-1)
        end
      
        it 'should render create new admin if email is not valid' do
          post :create, {email:""}
          expect(response).to redirect_to("http://test.host/dashboard/admins/new")
        end
      end 

      context 'regular admin is logged in' do
        login_admin
        it 'should not be able to create a new admin' do
          expect{
            post :create, {email: "test@example.com"}
          }.to change(Admin, :count).by(0)
        end 
      end

    end
  end

