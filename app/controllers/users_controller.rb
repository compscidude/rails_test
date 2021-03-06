class UsersController < ApplicationController
  

 before_action :logged_in_user, only: [:edit, :update, :destroy]
 before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
  end 
  
  def show
    @user = User.find(params[:id])  
  end 
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end 

  def create
    @user = User.new(user_params)
    if(@user.save)
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def destroy
    user = User.find(params[:id])
    if(user.destroy)
      flash[:success] = "Successfully Deleted User"
    end 
      redirect_to users_url
  end 

  def update
    user = User.find(params[:id])
    if(user.update_attributes(user_params))
      flash[:success] = "Successfully Updated User"
    end
      redirect_to user_url
  end 
  
  def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
      
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(users_url) unless @user == current_user
  end 
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
 