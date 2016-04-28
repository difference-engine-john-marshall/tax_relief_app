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
        post :create, FactoryGirl.attributes_for(:question)
      }.to change(Question, :count).by(1)
    end
  end

  describe "update" do
    it "updates the question" do
      question = FactoryGirl.create(:question)

      patch :update, FactoryGirl.attributes_for(:question, text: "updated text")

      question = Question.find_by(id: 1)
      expect(question.text).to eq("updated text")
    end

    it "does not update the question" do
      question = FactoryGirl.create(:question)

      patch :update, FactoryGirl.attributes_for(:question, text: nil)

      question = Question.find_by(id: 1)
      expect(question.yes_response).to eq("2")
    end
  end

  describe "delete" do
    it 'should delete a question' do
      question = FactoryGirl.create(:question)
      expect{
        delete :destroy, FactoryGirl.attributes_for(:question, id: 1)
      }.to change(Question, :count).by(-1)
    end
  end

end