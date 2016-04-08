class QuestionsController < ApplicationController

  def index

    @questions = Question.all
    #admin user only
  end

  def show
    @questions = Question.all

  end

  def new
    @questions = Question.new
  end

  def create
    @questions = Question.new({text: params[:text], qualifying_response: parmas[:qualifying_response], next_question_id: params[:next_question_id]})
  end

  def edit
    @questions = Question.all.find(params[:id])
  end 

  def update
    @questions = Question.update({text: params[:text], qualifying_response: parmas[:qualifying_response], next_question_id: params[:next_question_id]})
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end 

end
