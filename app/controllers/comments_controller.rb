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


def create

  @post = Post.find(params[:comment][:post_id])
  @comment = @post.comments.create(comment_params)
  redirect_to control_panel_show_path(params[:comment][:url_hash])

end

def feedback
  @post = Post.find(params[:comment][:post_id])

  user_hash = params[:comment][:url_hash]
  @user = User.find_by(url_hash: user_hash)
  
  if @user == nil
    redirect_to root_path and return
  end

  @comment = @post.comments.create(comment_params)

  redirect_to progress_path(user_hash)
end



private
  def comment_params
    params.require(:comment).permit(:content, :commenter)
  end


end
