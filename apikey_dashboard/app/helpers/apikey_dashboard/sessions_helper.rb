module ApikeyDashboard
  module SessionsHelper
    def login(user)
      session[:userid] = user.id
    end

    def logout
      session.delete :userid
    end

    def current_user
      @current_user ||= User.find(session[:userid]) if session[:userid]
    end

    def require_login
      unless logged_in?
        flash[:danger] = 'Du är inte inloggad!'
        redirect_to login_path
      end
    end

    def logged_in?
      !current_user.nil?
    end

    def admin?
      current_user.admin
    end
  end
end
