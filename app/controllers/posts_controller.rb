class PostsController < ApplicationController
   http_basic_authenticate_with name: "dhh", password: "secret", except: :index
   
def index

  @user = User.find_by(url_hash: params[:url_hash])
  
  if @user == nil
    redirect_to users_path and return
  end

  @posts = @user.posts
  # @comments = Comment.all
  # @users = User.all
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
