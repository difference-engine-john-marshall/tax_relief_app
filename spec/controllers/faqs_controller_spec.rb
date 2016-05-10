require 'rails_helper'

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

RSpec.describe FaqsController, type: :controller do
  login_admin

  describe "create" do
    it 'should create a new faq' do
      expect{
        post :create, FactoryGirl.attributes_for(:faq)
      }.to change(Faq, :count).by(1)
    end
  end

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

  describe "delete" do
    it 'should delete a faq' do
      question = FactoryGirl.create(:faq)
      expect{
        delete :destroy, FactoryGirl.attributes_for(:faq, id: 1)
      }.to change(Faq, :count).by(-1)
    end
  end

end
