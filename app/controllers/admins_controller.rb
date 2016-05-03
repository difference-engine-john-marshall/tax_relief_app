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
      Rails.logger.info "TEST"

    if @admin.save
      email = params[:email]
      AdminNewMailer.admin_new(email).deliver_now
      flash[:success] = "Message sent"

      redirect_to root_path

    else
      Rails.logger.info "TEST 2"
      render :new
    end
  end
end
