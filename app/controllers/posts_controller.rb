class PostsController < ApplicationController

  def index 
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end
  def create
    Post.create(text: post_params[:text], user_id: current_user.id)
  end
  private
  def post_params
    params.require(:post).permit(:text)
  end
  def move_to_index
    redirect_to action: :index
    # indexアクションを強制的に実行する
  end
  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end



end
