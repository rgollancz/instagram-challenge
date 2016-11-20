class CommentsController < ApplicationController
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action do
    @currentUser = current_user.id
  end


  def index
      redirect_to '/'
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @id = params[:post_id]
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @post = Post.find_by_id(params[:comment][:id])
    User.create_comment(@post, @currentUser, comment_params)
    redirect_to '/posts'
    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
