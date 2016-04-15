class Api::V1::QuestionsController < ApplicationController

  def index
    @questions = Question.order(:id)
  end
  
end