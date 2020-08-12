class ApplicationController < ActionController::Base
  # method2 di sini bisa dipake di semua controller karena semua controller inherit class ini
  # tapi method2 di sini cuma bisa dipake oleh controller only
  # contohnya, current_user yg skrg ini kan pindahan dari application_helper.rb yang tadinya supaya views bisa pake current_user
  # tapi karena dipindahin ke sini, views pada gabisa akses methodnya
  # supaya semua controller bisa akses current_user dan views juga tetep bisa akses current_user,
  #         makanya harus tambahin helper_method kayak di line 9

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # pake @current_user ||= itu supaya  querynya sekali aja kalau ganti user
  end

  def logged_in?
    !!current_user
    # !! used to turn something to boolean
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
