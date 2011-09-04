class RegistrationsController < ApplicationController
  def new
    sso_user = session[:sso]
    @user = User.new :first_name => sso_user[:first_name], :last_name => sso_user[:last_name], :email => sso_user[:email]
  end

  def create
    sso_user = session[:sso]
    @user = User.new :first_name => sso_user[:first_name], :last_name => sso_user[:last_name], :email => sso_user[:email], :sso_user_id => sso_user[:user_id]
    @user.save
    redirect_to '/hello'
  end
end
