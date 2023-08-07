# frozen_string_literal: true

class PhotoFacade
  def photos_of_country(country)
    photo_data = PhotoService.new.get_photos(country)
    photo_data[:results].map do |photo|
      Photo.new(photo)
    end
  end
end
