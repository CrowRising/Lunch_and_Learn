# frozen_string_literal: true

class Photo
  attr_reader :url, :alt_tag, :id

  def initialize(data)
    @url = data[:urls][:regular]
    @alt_tag = data[:alt_description]
    @id = nil
  end
end
