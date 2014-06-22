class CommentsController < ApplicationController

def index
  @comments = Comment.all
end


def new

  @comment = Comment.new

end

def feedback
  @post = Post.find(params[:comment][:post_id])
  @comment = @post.comments.create(comment_params)

  redirect_to root_path
end



private
  def comment_params
    params.require(:comment).permit(:content)
  end


end
