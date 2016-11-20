class PostsController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to '/'
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def create


  end

end
