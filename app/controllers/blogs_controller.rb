class BlogsController < ApplicationController
  before_action :set_blog, only: [:update, :destroy]
  # before_action :authenticate_token
  # before_action :authorize_user, only: [:create]

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
    puts 'POST /blogs Create using ' + blog_params.to_s
    puts 'author ' + params[:author].to_s
    puts 'subject ' + params[:subject].to_s
    puts 'content ' + params[:content].to_s
    puts 'usr_id ' + get_current_user.id.to_s

    authorize_user(get_current_user.id)

    @blog = Blog.new(author: params[:author], subject: params[:subject], content: params[:content], user_id: get_current_user.id)

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
