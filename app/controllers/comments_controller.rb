class CommentsController < ApplicationController
  # def index
  # end

  # def show
  # end

  def create
    @comment = Comment.find(params[:post_id, :current_user])
    @comment = current_user.comments.build(require(:comment).permit(:title, :body)
    @post.topic = @topic
     authorize @post
     authorize @user
   end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
end
