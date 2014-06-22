class UsersController < ApplicationController
   http_basic_authenticate_with name: "dhh", password: "secret"

def index
  @users = User.all
end

def new

  @user = User.new

end

def create
  @user = User.new(user_params)

  @user.url_hash = SecureRandom.hex
  
  @user.save
  redirect_to users_path
end


private
  def user_params
    params.require(:user).permit(:name)
  end

end