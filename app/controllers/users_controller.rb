class UsersController < ApplicationController

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  if @user.update(user_params)
    redirect_to control_panel_path
  else
    render 'edit'
  end
end

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

  subject = "Welcome to Phi!"
  body = "Check progress on your project and give us feedback at " + progress_url(@user.url_hash)
  ActionMailer::Base.mail(:to => @user.email, :subject => subject, :body => body).deliver

  redirect_to control_panel_path
end


private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end