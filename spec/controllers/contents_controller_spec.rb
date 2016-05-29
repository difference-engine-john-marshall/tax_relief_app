require 'rails_helper'

def login_admin
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin)
  end
end

RSpec.describe ContentsController, type: :controller do

  describe "update" do
    login_admin
    it "updates the contents text" do
      content = FactoryGirl.create(:content)

      patch :update, FactoryGirl.attributes_for(:content, text: "updated text")

      content = Content.find_by(id: 1)
      expect(content.text).to eq("updated text")
    end
  end
end