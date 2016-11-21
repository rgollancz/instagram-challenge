class PostsController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to '/'
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    if !user_signed_in?
      redirect_to '/'
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to '/posts'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes!(post_params)
      redirect_to '/posts'
    else
      flash[:notice] = "Your update could not be saved. Please try again."
      redirect_to "/posts/#{params[:id]}/edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
