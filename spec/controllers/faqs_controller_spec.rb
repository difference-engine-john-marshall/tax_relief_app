require 'rails_helper'

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

RSpec.describe FaqsController, type: :controller do
  login_admin

  describe "update" do
    it "updates the faq" do
      faq = FactoryGirl.create(:faq)

      patch :update, FactoryGirl.attributes_for(:faq, question_text: "updated text")

      faq = Faq.find_by(id: 1)
      expect(faq.question_text).to eq("updated text")
    end

    xit "does not update the question" do
      question = FactoryGirl.create(:question)

      patch :update, FactoryGirl.attributes_for(:question, text: nil)

      question = Question.find_by(id: 1)
      expect(question.yes_response).to eq("2")
    end
  end

end
