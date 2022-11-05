class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to user_post_path(user_id: current_user.id, id: @post.id)
    else
      render :new
    end
  end

  def destroy
    find_post
    @post.destroy
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
