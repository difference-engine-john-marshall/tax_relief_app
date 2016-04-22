class QuestionsController < ApplicationController
  # before_action :authenticate_admin!

  def home

  end

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
    @question = Question.new({text: params[:text], yes_response: params[:yes_response], no_response: params[:no_response], prequalifier: params[:prequalifier]})
    
      @question.save

      if @question.save
        flash[:success] = "New question created"
        redirect_to '/questions_index'
      else
        flash[:warning] = "Question not saved"
        redirect_to '/questions_index/new'
      end

# how do we control that the new question fits in preceeds and proceeds the appropriate question?
# verify yes_response is unique?

  end

  def edit
    @questions = Question.all.find(params[:id])
  end 

  def update
    @questions = Question.update({text: params[:text], qualifying_response: params[:qualifying_response], next_question_id: params[:next_question_id]})
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
     flash[:success] = "Question deleted"
        redirect_to '/questions_index'
  end 

end
