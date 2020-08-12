module ApplicationHelper 
  # helper method that can be used in views only
  def gravatar_for(user, options = { size: 80 })
    # default for size is 80, but can be overriden
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   # pake @current_user ||= itu supaya  querynya sekali aja kalau ganti user
  # end

  # current_user ini kan cuma available di views, tapi mau dipake buat controller juga, contohnya di articles_controller's create
  # jadi harus dipindahin ke application_controller.rb supaya disana bisa diakses oleh controllernya

  # def logged_in?
  #   !!current_user
  #   # !! used to turn something to boolean
  # end
  
  # logged_in? ini juga sama aja, tadinya cuma dipake di views, tp skrg mau dipake di pages_controller
  # supaya kalo orang udah logged in, dia gabisa ke defaut home page yang ada "sign up" buttonnya
  # jadinya dipindahin ke application_controller.rb


  # CONCLUSION
  # Methods yang ada di application_helper hanya untuk methods yang akan dipakai di views saja

  # Methods yang dipakai di controllers dan views harus ada di application_controller
end
