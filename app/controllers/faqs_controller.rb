class FaqsController < ApplicationController
  layout "admin-application", except: :index
  before_action :authenticate_admin!, except: :index

  def index
    @faqs = Faq.all
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new({
      question_text: params[:question_text],
      answer_text: params[:answer_text]
      })

    if @faq.save
      flash[:success] = "FAQ created!"
      redirect_to '/dashboard/faqs'
    else
      flash[:warning] = "FAQ was not created!"
      render :new
    end

  end

  def edit
    @faq = Faq.find_by(id: params[:id])
  end

  def update
    @faq = Faq.find_by(id: params[:id])
    if @faq.update({
      question_text: params[:question_text], 
      answer_text: params[:answer_text]
      })
      flash[:success] = "FAQ updated!"
      redirect_to "/dashboard/faqs"
    else
      flash[:warning] = "FAQ not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy
    flash[:success] = "FAQ deleted"
    redirect_to '/dashboard/faqs'
  end 

  def faqs_dashboard
    @faqs = Faq.all
  end
end
