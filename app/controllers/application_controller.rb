class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :resource
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :current_country
  helper_method :current_currency
  helper_method :target_currency

  DEFAULT_COUNTRY = 'CL'

  private
    def current_user
      begin
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      rescue Exception => e
        nil
      end
    end

    def current_country
      @currency_country ||= request.env['HTTP_CF_IPCOUNTRY'] || 'US'
    end

    def current_currency
      country_code = current_user.try(:country_code) || request.try(:location).try(:country_code) || DEFAULT_COUNTRY
      COUNTRY_CURRENCIES[country_code]
    end

    def target_currency
      if params[:target_currency].present?
        params[:target_currency]
      elsif current_currency == 'USD'
        COUNTRY_CURRENCIES[country_code]
      else
        COUNTRY_CURRENCIES['US']
      end 
    end

    def resource
      current_user
    end

    def user_signed_in?
      return true if current_user
    end

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied."
      end
    end

    def authenticate_user!
      if !current_user
        redirect_to root_url, :alert => 'You need to sign in for access to this page.'
      end
    end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
