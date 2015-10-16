module DashboardHelper

  def options_yes_no
    return [["Yes", true], ["No", false]]
  end

  def device_types
    return [["Wall Switch", 1], ["Plug-In Module", 2]]
  end

  def collection_options(collection)
    options_array = []
    return ["No Values"] if collection.nil?
    collection.each do |item|
      options_array << [item.name, item.id]
    end

    return options_array
  end

  def active_property
    session[:active_property]
  end

  def active_property?
    return true if session[:active_property]
  end

  def active_room
    session[:active_room]
  end

  def active_room?
    return true if session[:active_room]
  end

  def thumbnail_config
    {:radius=>50, :width=>75, :height=>75, :crop=>:thumb, :gravity=>:center, :class=>"profile-image property-image"}
  end

  def thumbnail(object)
    if object.nil?
      cl_image_tag("http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png", thumbnail_config)
    else
      cl_image_tag(object, thumbnail_config)
    end
  end

   def header_image_config
    {:radius=>50, :width=>40, :height=>40, :crop=>:thumb, :gravity=>:center, :class=>"header_image"}
  end

  def header_image(object)
    if object.nil?
      cl_image_tag("http://res.cloudinary.com/hupgpadmb/image/upload/v1444201245/DefaultProperty.png", header_image_config)
    else
      cl_image_tag(object, header_image_config)
    end
  end

  def class_color_for_property(property)
    return "default" if @configuration[:active_property].nil?

    if @configuration[:active_property].id == property.id
      return "danger"
    else
      return "default"
    end
  end

  def class_color_for_room(room)
    return "default" if @configuration[:active_room].nil?

    if @configuration[:active_room].id == room.id
      return "danger"
    else
      return "default"
    end
  end

end
