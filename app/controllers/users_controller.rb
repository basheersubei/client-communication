class UsersController < ApplicationController


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

  ActionMailer::Base.mail(:from => "admin@we-are-phi.com", :to => "basheersubei@gmail.com", :subject => "test", :body => "test, check this: " + @user.url_hash).deliver

  redirect_to control_panel_path
end


private
  def user_params
    params.require(:user).permit(:name)
  end

end