class ContentsController < ApplicationController
  layout "admin-application"

  before_action :authenticate_admin!

  def index
    @contents = Content.all
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update({text: params[:text], id: params[:id]})
    
      flash[:success] = "Content Edited"
      redirect_to '/dashboard/questions'
    else
      flash[:warning] = "Content not saved"
      render :edit
    end
  end

end
