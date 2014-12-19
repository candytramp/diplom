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
      #RoleUser # FIXME: write scope in model
      @current_user_object = User.where(
        :login => @current_user).roles_join.first
#        :login => @current_user).includes(:role_users).first
      unless check_ctr_auth()
#      redirect_to(:controller => :roles, :action => :access_denied,
#        :bad_action_name => action_name,
#        :bad_controller_name => controller_name)
        raise 'qq'
      end
      if session[:role_id]
        @current_user_object.current_role = RoleUser.find(session[:role_id])
      end
    end
  end

  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def change_role
    role = RoleUser.find(params[:id])
    @current_user_object.current_role = role
    if @current_user_object.current_role.id != role.id
      flash.now[:error]="Недоступная роль для данного пользователя"
      render(text: "", layout: true)
    else
      session[:role_id] = role.id
      redirect_to :root
    end
  end

  private
  def check_ctr_auth()
    return true if action_name == 'logout'
    return true unless @current_user.blank?
    return false
  end
end

