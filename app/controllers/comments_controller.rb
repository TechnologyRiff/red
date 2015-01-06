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

  #   if @post.save
  #     flash[:notice] = "Post was saved."
  #     redirect_to [@topic, @post]
  #   else
  #     flash[:error] = "There was an error saving the post. Please try again."
  #     render :new
  #   end
  # end

  # end

  # def edit
  # end
end
