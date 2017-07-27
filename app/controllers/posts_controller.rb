class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
    @sorted_latest_posts = @posts.order(:created_at).limit(4)
    @older_posts = @posts - @sorted_latest_posts
  end

  def show
    @post = Post.find(params[:id])
    @posts = Post.all.order("created_at DESC")
    @sorted_latest_posts = @posts.order(:created_at).limit(20)
    @older_posts = @posts - [@post]
  end

  private
  def post_params
    params.require(:post).permit(:title,:body)
  end
end
