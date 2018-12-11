class PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: [:show, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_member.admin? ? Post.all : Post.where(private: false)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @new_comment = Comment.build_from(@post, current_member.id, "")
  end

  # GET /posts/new
  def new
    @post = current_member.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def check_admin
      unless current_member.admin? || current_member == @post.member
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :private, :member_id)
    end
end