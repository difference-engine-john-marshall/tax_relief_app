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

    it "does not update the faq" do

      faq = FactoryGirl.create(:faq)
      patch :update, FactoryGirl.attributes_for(:faq, question_text: nil)
      faq = Faq.find_by(id: 1)
      expect(faq.question_text).not_to eq("updated text")

    end
  end

end
