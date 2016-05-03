class AdminsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(
      email: params[:email],
      password: "defaulty",
      password_confirmation: "defaulty"  
    )

    if @admin.save
      
      email = params[:email]
      AdminNewMailer.admin_new(email).deliver
      flash[:success] = "Message sent"

      redirect_to root_path

    else
      render :new
    end
  end
end
