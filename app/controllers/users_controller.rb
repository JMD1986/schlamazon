class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Hello #{user.name}"
    else
      flash[:alert] = "Error Occured"
    end
  end

  def show
    authenticate_user!
    begin
      if current_user.id == session[:user_id]
        @user = User.find(session[:user_id])
      end
    rescue ActiveRecord::RecordNotFound
      redirect_to :back, flash[:alert] = "Record not found"
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
