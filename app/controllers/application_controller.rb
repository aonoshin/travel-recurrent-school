class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def admin_check
      if current_user.id == 0
      else
          flash[:alert] = "権限がありません。"
          redirect_to "/"
      end
  end
  
end
