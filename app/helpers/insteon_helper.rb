module InsteonHelper

  def linked_property
    Property.find_by(:insteon_house_id).id
  end

end
