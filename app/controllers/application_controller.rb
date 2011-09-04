class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_signed_in?, :current_user

  def login_required
    check_sso
  end

  def user_signed_in?
    !current_user.nil?
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def check_sso
    if session[:user_id]
      true
    else
      if session[:sso] && session[:sso][:user_id]
        # registration page
        if user = User.find_by_sso_user_id(session[:sso][:user_id])
           session[:user_id] = user.id
        else
          redirect_to new_registration_url
        end
      else
        # sso
        session[:hancock_sso_return_to] = request.fullpath[request.script_name.size..-1]
        redirect_to "/sso/login"
      end
    end
  end
end
