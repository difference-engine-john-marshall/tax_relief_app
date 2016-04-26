class Question < ActiveRecord::Base
  validates :text, presence: true
  validates :no_response, presence: true
end

