class SessionsController < ApplicationController
  def new
    user = User.find(:first, :conditions => ['login = ?',params[:login]])
    respond_to do |format|
      if user && (user[:password] == params[:password])
          session[:user_id] = params[:login]
          format.html { redirect_to(request.referer, :notice => 'Log in succesful, Welcome.') }
        else
          format.html { redirect_to(request.referer, :notice => 'Log in failed.') }
      end
    end
  end
  def destroy
    logger.debug("log out ")
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to(request.referer, :notice => 'Log out succesful, Bye.') }
    end
  end
end
