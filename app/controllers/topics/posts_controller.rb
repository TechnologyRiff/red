class Topics::PostsController < ApplicationController
  
  def index
    @topics = Topics.search(params[:search])
    @posts = Posts.search)params[:search]
    # if params[:search]
    #   @topics = Topic.visible_to(current_user).find(:all, conditions => ['name like ?', "%#{params[:search]}"]).paginate(page: params[:page], per_page: 10)
    #   @posts = Post.visible_to(current_user).find(:all, conditions =>['name like ?', "%#{params[:search]}"]).paginate(page: params[:page], per_page: 10)
    end


  def show
     @topic = Topic.find(params[:topic_id])
     @post = Post.find(params[:id])
     @comments = @post.comments
     authorize @topic
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(post_params)
    @post.topic = @topic
    authorize @post

    if @post.save_with_initial_vote
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
  
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    
    if @post.update_attributes(post_params)
      flash[:notice] = "Post was updated."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    title = @post.title
    authorize @post

    if @post.destroy
      flash[:notice] = "\"#{title}\" was deleted successfully."
      redirect_to @topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end

