module ApplicationHelper


  def time_format(datetime)
    datetime.strftime('%l:%M %P') unless datetime.blank?
  end

  def date_format(datetime)
    datetime.strftime('%a %e %B %Y') unless datetime.blank?
  end

  def profile_image_link(source)
    if source.image.blank?
      return "http://heatherchristenaschmidt.files.wordpress.com/2011/09/facebook_no_profile_pic2-jpg.gif" 
    else
      return source.image
    end
  end

  def property_image_link(source)
    if source.image.blank?
      return "https://d1luk0418egahw.cloudfront.net/static/images/guide/NoImage_592x444.jpg"
    else
      return source.image
    end
  end

  def property_listing(property)
    listing = "<a href='" + property_path(property.id) + "'>"
    listing += "  <div class='listing-container'>"
    listing += "    <div class='listing-pic-container'>"
    listing += "      <div class='listing-pic'>"
    listing +=          image_tag(property_image_link(property))
    listing += "      </div>"
    listing += "    </div>"
    listing += "    <div class='listing-price'>"
    listing +=        link_to('$' + property.rent.to_i.to_s, property)
    listing += "    </div>"
    listing += "    <div class='listing-profile'>"
    listing +=        image_tag(profile_image_link(property.user)) 
    listing += "    </div>"
    listing += "    <div class='listing-title'>"
    listing +=        link_to(property.title, property)
    listing += "    </div>"
    listing += "  </div>"
    listing += "</a>"
  end


end
