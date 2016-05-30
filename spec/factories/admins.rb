FactoryGirl.define do
  factory :admin do
    email "admin@test.com"
    password "password"
    password_confirmation "password"

    factory :superadmin do
      superadmin true
    end
  end  
end
