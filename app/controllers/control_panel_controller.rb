class ControlPanelController < ApplicationController

def index
	@users = User.all
end

def show

  @user = User.find_by(url_hash: params[:url_hash])
  
  if @user == nil
    redirect_to control_panel_path and return
  end

  @posts = @user.posts.order('created_at ASC')

end

end
