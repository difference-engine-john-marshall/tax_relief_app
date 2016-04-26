require 'rails_helper'

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

RSpec.describe QuestionsController, type: :controller do
  login_admin

  describe "create" do
    it 'should create a new question' do
      expect{
        post :create, {text: "blah blah", no_response: "1"}
      }.to change(Question, :count).by(1)
    end

  end
end
