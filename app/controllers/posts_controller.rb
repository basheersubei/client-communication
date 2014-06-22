class PostsController < ApplicationController

def index
  @posts = Post.all
  @comments = Comment.all
  @users = User.all
end

def new

  @post = Post.new

end

def create
  @post = Post.new(post_params)

  @post.save
  redirect_to posts_path
end


private
  def post_params
    params.require(:post).permit(:title, :content)
  end


end