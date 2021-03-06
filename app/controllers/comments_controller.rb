class CommentsController < ApplicationController


def destroy
  @comment = Comment.find(params[:id])
  @post = Post.find(@comment.post_id)
  @user = User.find(@post.user_id)

  @comment.destroy
 
  redirect_to control_panel_show_path(@user.url_hash)
end

def index
  @comments = Comment.all
end


def new

  @comment = Comment.new

end

# this is where the admin creates a comment from the control_panel view
def create

  @post = Post.find(params[:comment][:post_id])
  @comment = @post.comments.create(comment_params)

  @user = User.find(@post.user_id)

	subject = "Project Notification from Phi!"  
	body = "We've posted a new comment on Phi:\n" + @comment.content + " \nPlease check progress on your project and give us feedback at " + progress_url(@user.url_hash)
	ActionMailer::Base.mail(:to => @user.email, :subject => subject, :body => body).deliver
	
  redirect_to control_panel_show_path(params[:comment][:url_hash])

end

# this is where the client creates a new comment as feedback (from progress view)
def feedback
  @post = Post.find(params[:comment][:post_id])

  user_hash = params[:comment][:url_hash]
  @user = User.find_by(url_hash: user_hash)
  
  if @user == nil
    redirect_to 'http://we-are-phi.com/' and return
  end

  @comment = @post.comments.create(comment_params)

	subject = "Project Notification from Phi!"
	body = "The client has added a comment on Phi:\n" + @comment.content + " \nPlease check progress at " + control_panel_show_url(@user.url_hash)
  ActionMailer::Base.mail(:to => ADMIN_EMAIL, :subject => subject, :body => body).deliver

  redirect_to progress_path(user_hash)
end



private
  def comment_params
    params.require(:comment).permit(:content, :commenter, :photo, :post_id)
  end


end
