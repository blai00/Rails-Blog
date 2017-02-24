class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def index
    
  end

  def new
   
  end
  
  def create
    user = User.create(user_params)
    if user.save
      redirect_to user
    else
      flash[:message] = 'Invalid'
      redirect_to new_user_url
    end
  end

  def edit
  end
  
  def update
    @user.update(user_params)
    redirect_to @user
  end 

  def show
  end
  
  def destroy
    @user.destroy
    redirect_to new_user_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end 
  
  def find_user
    @user = User.find(params[:id])
  end
end
