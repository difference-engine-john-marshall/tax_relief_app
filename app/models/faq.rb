class Faq < ActiveRecord::Base
  validates :question_text, presence: true
  validates :answer_text, presence: true
end
