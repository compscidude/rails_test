class UsersController < ApplicationController
  

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
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  
end
 