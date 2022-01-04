class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
    @users = User.all
    
  end
  
  def index
    @user = User.find(params[:id])
    @users = User.all
    @post = Post.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
   private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :prefectures_select)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
   
end
