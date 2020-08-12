module ApplicationHelper
  
  def gravatar_for(user, options = { size: 80 }) # helper method that can be used in views
    # default for size is 80, but can be overriden
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

end
