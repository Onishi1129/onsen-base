class PostController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @Post.user_id = current_user.id
    @post.save
    redirect_to post_path
  end

  def index
    @posts=Post.all
  end

  def show
  end

  def destroy
  end

private

  def post_params
    params.require(:post).permit(:onsen_place, :onsen_name, :image, :caption)
  end
  
end

