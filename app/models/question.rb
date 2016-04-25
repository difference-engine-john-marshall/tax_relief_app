class Question < ActiveRecord::Base
  # validates admin?
  validates :text, presence: true
  validates :no_response, presence: true
  validates :no_response, uniqueness: true
end

