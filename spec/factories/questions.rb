FactoryGirl.define do
  factory :question do
    id 1
    text "Have you received a tax collection notice in the mail from the IRS? A tax collection notice is a letter from the IRS that states your name, social security number, and the tax year at issue. The notice will also state the amount of tax due and any potential problems they found with your return."
    yes_response "2"
    no_response "faq"
    prequalifier "1"
  end

end
