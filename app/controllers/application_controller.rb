class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_admin

  def check_admin
    if current_user.present?
      unless current_user.try(:is_admin?)
        binding.pry
        redirect_to root_path
      end
    end
  end
end
