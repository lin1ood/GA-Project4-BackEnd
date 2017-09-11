class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_user, except: [:login, :create, :index]
  before_action :user_params, only: [:login]

  # user login
  def login
    puts '--- LOGIN ---'
    # params.each do |i|
    #   puts i
    # end
    # #
    # puts params[:user][:username]
    # puts params[:user][:password]
    # #
    puts username: params[:user][:username]
    puts password: params[:user][:password] #= 'Linwood'
    puts user = User.find_by(username: params[:user][:username])
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])

      puts user
      puts user.id
      puts user.username

      token = create_token(user.id, user.username)
      render json: {status: 200, token: token, user: user}
    else
      render json: {status: 401, message: "Unauthorized - Login"}
    end
  end

  # GET /users
  def index
    puts '---- GET Index /users -----'
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    # rails s console shows the id of the user (Parameters: {"id"=>"3"}) when postman get request of localhost:3000/users/3 is made.. but get 401 error in postman w/status 200 OK
    render json: @user
    #in markdown this change is referenced w/same results as commented above:
    # render json: get_current_user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    def create_token(id, username)
      puts '---- CREATE TOKEN ----'
      JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
    end

    def payload(id, username)
    {
      # exp: (1.day.from_now).to_i,
      exp: (Time.now + 30.minutes).to_i,
      iat: Time.now.to_i,
      iss: ENV['JWT_ISSUER'],
      user: {
        id: id,
        username: username
      }
    }
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      puts '--- PARAM WHITE LIST ---'
      params.require(:user).permit(:username, :password)
    end
end
