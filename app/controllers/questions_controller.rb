class QuestionsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :show, :new, :create, :edit, :update, :destroy]

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
    @question = Question.new
  end

  def create
    @question = Question.new({text: params[:text], yes_response: params[:yes_response], no_response: params[:no_response], prequalifier: params[:prequalifier]})
    session[:return_to] = request.referer

    if @question.save
      flash[:success] = "New question created"
      redirect_to '/questions_index'
    else
      flash[:warning] = "Question not saved"
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end 

  def update
    @question = Question.find(params[:id])
    if @question.update({text: params[:text], yes_response: params[:yes_response], no_response: params[:no_response], prequalifier: params[:prequalifier], id: params[:id]})
    
      flash[:success] = "Question Edited"
      redirect_to '/questions_index'
    else
      flash[:warning] = "Question not saved"
      render :edit
      # redirect_to request.referer
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to '/questions_index'
  end 

end
