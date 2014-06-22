class CommentsController < ApplicationController
   http_basic_authenticate_with name: "dhh", password: "secret"
def index
  @comments = Comment.all
end


def new

  @comment = Comment.new

end

def create
  @post = Post.find(params[:comment][:post_id])
  @comment = @post.comments.create(comment_params)

  redirect_to posts_path
end



private
  def comment_params
    params.require(:comment).permit(:content)
  end


end
