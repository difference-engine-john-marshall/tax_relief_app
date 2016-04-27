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



  context "valid attributes" do
    it "locates the question" do
      question = create(:question, text: "blah blah", no_response: "9")

      patch :update, id: question, question: attributes_for(:question)
      expect(assigns(:question)).to eq(question)
    end
  end
  end


  
