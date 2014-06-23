class ControlPanelController < ApplicationController

def index
	@users = User.all
end

def show

  @user = User.find_by(url_hash: params[:url_hash])
  
  if @user == nil
    redirect_to control_panel and return
  end

  @posts = @user.posts

end

end
