class BlogsController < ApplicationController
  before_action :set_blog, only: [:update, :destroy]
  # before_action :authenticate_token
  # before_action :authorize_user, only: [:destroy]

  # GET /blogs
  def index
    @blogs = Blog.all

    render json: @blogs
  end

  # GET /blogs/1
  def show
    puts '----- /blogs GET show ------'
    # puts 'Current User.id = ' + get_current_user.id.to_s
    # autorize current user by id
    # if not a valid user will not come back
    # for this render
    puts 'GET_CURRENT_USER.ID = ' + get_current_user.id.to_s
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
    # is this the owner ???
    authorize_user(get_current_user.id)

    puts 'DELETE /blogs/id destroy ' + get_current_user.id.to_s
    puts '@blog.user_id = ' + @blog.user_id.to_s

    if @blog.user_id == get_current_user.id
      @blog.destroy
    else
      render json: {status: :unprocessable_entity}
    end
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
