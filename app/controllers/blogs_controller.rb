class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]
  # before_action :authenticate_token
  # before_action :authorize_user, except: [:index]

  # GET /blogs
  def index
    @blogs = Blog.all

    render json: @blogs
  end

  # GET /blogs/1
  def show
    # puts 'Current User.id = ' + get_current_user.id.to_s
    # autorize current user by id
    # if not a valid user will not come back
    # for this render
    authorize_user(get_current_user.id)
    @user_blogs = User.find(params[:id]).blogs
    render json: @user_blogs
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: @blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:author, :subject, :content)
    end
end
