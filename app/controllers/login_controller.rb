class LoginController < ApplicationController
  layout "main"
  
  def index
    if request.post?
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:controller => :images, :action => :index)
      else
        flash.now[:notice] = "Invalid Email/Password"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to(:controller => :images, :action => :index)
  end

end
