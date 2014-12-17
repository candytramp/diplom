class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    session[:cas_user]
  end

  before_filter :check_auth
  before_filter :check_app_auth

  def check_auth()
    unless request.format.js?
      CASClient::Frameworks::Rails::Filter.filter(self)
    end
  end

  def check_app_auth()
    if session[:cas_user].nil?
      redirect_to(:controller => :roles, :action => :access_denied,
        :bad_action_name => action_name,
        :bad_controller_name => controller_name)
    else
      @current_user = session[:cas_user]
      RoleUser # FIXME: write scope in model
      @current_user_object = User.where(
        :login => @current_user).includes(:role_users).first
      unless check_ctr_auth()
#      redirect_to(:controller => :roles, :action => :access_denied,
#        :bad_action_name => action_name,
#        :bad_controller_name => controller_name)
        raise 'qq'
      end
      if session[:role_id]
        @current_user_object.current_role = RoleUser.create_from_session(session)
      end
    end
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def change_role
    role = RoleUser.find(params[:id])
    unless role.nil?
      @current_user_object.current_role = role
      @current_user_object.current_role.store_to_session(session)
    end
    redirect_to :root
  end

  private
  def check_ctr_auth()
    return true if action_name == 'logout'
    return true unless @current_user.blank?
    return false
  end
end

