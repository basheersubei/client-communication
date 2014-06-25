class PostsController < ApplicationController

def edit
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
end

def update
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)


  if @post.update(post_params)
    redirect_to control_panel_show_path(@user.url_hash)
  else
    # redirect_to post_path(@post)
    render 'edit'
  end
end


def destroy
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)

  @post.destroy
 
  redirect_to control_panel_show_path(@user.url_hash)
end

def progress

  @user = User.find_by(url_hash: params[:url_hash])
  
  if @user == nil
    redirect_to root_path and return
  end

  @posts = @user.posts.order('created_at ASC') 
  # @comments = Comment.all
  # @users = User.all
end

def new

  @post = Post.new

end

def create
  @post = Post.new(post_params)

  @user = User.find_by(url_hash: params[:post][:url_hash])
  @post.save

  subject = "Project Notification from Phi!"
  body = "We've posted something new on Phi:\n" + @post.content + " \nPlease check progress on your project and give us feedback at " + progress_url(@user.url_hash)
  ActionMailer::Base.mail(:from => ADMIN_EMAIL, :to => @user.email, :subject => subject, :body => body).deliver


  redirect_to control_panel_show_path(@user.url_hash)
end


private
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :avatar)
  end


end
