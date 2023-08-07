# frozen_string_literal: true

module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        video = VideoFacade.new.videos_of_country(params[:country])
        photo = PhotoFacade.new.photos_of_country(params[:country])
        if video.empty? || photo.empty?
          render json: LearningResourceSerializer.new.empty_data_format(params[:country])
        else
          render json: LearningResourceSerializer.new.data_format(params[:country], video.first, photo)

        end
      end
    end
  end
end
