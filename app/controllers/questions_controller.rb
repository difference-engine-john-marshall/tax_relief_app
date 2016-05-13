class QuestionsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :create, :edit, :update, :destroy]

  layout "admin-application", except: [:show, :home, :classic, :equitable]

  def home

  end

  def index
    @questions = Question.all.order(:id)
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
      redirect_to '/dashboard/questions'
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
      redirect_to '/dashboard/questions'
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
    redirect_to '/dashboard/questions'
  end 

  def classic
  end

  def equitable
  end

end
