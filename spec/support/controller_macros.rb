module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Admin.create(email: "admin@test.com", password: "password", password_confirmation: "password") #FactoryGirl.create(:admin) # Using factory girl as an example
    end
  end
end