class PostsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish]
  before_action :check_admin, except: [:new, :create, :show, :index]

  # GET /posts
  # GET /posts.json
  def index
    @posts = current_member.admin? ? Post.unscoped : Post.where(private: false).or(Post.unscoped.where(member: current_member))
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
    @post.visible = false unless current_member.admin?

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

  def publish
    @post.update_attribute(:visible, !@post.visible)
    redirect_back(fallback_location: root_path, notice: "Post was successfully #{@post.visible? ? 'Published' : 'Unpublished'}")
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
      @post = Post.unscoped.find(params[:id])
    end

    def check_admin
      unless current_member.admin? || current_member == @post.member
        flash[:error] = "You do not have access for this operation"
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :private, :member_id, :visible, :active, :on_date)
    end
end
