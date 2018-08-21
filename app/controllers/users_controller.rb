class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  before_action :require_correct_user, only: [:edit, :show, :update, :destroy]

  def new
    # render layout: "two_column"
    # render json: us_states
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    # if user.valid?
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end

  private
    def require_correct_user
      if current_user != User.find(params[:id])
        redirect_to "/users/#{session[:user_id]}"
      end
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
    end
end
