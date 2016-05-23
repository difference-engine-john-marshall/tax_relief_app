class AdminsController < ApplicationController
  layout "admin-application"
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
      AdminNewMailer.admin_new(email).deliver_now
      flash[:success] = "Message sent"
      redirect_to '/dashboard'
    else
      render :new
    end
  end

  def edit
    @admins = Admin.all
  end
end
