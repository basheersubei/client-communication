class CommentsController < ApplicationController

def index
  @comments = Comment.all
end


def new

  @comment = Comment.new

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
    params.require(:comment).permit(:content)
  end


end
