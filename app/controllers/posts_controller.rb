class PostsController < ApplicationController

  def create
    @post=Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "You have created  successfully."
    else
      @posts = Post.all
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post= Post.find(params[:id])
    @user = current_user
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
    @post = Post.new
    if params[:onsen_place].present?
      @posts = Post.where('onsen_place LIKE ?', "%#{params[:onsen_place]}%")
    else
      @posts = Post.none
    end
    render "index"
  end

private

  def post_params
    params.require(:post).permit(:onsen_place, :onsen_name, :image, :caption)
  end

end

