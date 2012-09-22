module UsersHelper
  def gravatar_for(geek, size)
    gravatar_id = Digest::MD5::hexdigest(geek.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: geek.name, class: "gravatar", :height => "#{size}")
  end
end
