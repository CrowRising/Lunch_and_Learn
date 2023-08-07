# frozen_string_literal: true

class LearningResourceSerializer
  def data_format(country, video, images)
    {
      data: {
        id: nil,
        type: 'learning_resource',
        attributes: {
          country:,
          video: {
            title: video.title,
            youtube_video_id: video.youtube_video_id
          },
          images: images.map do |image|
            {
              alt_tag: image.alt_tag,
              url: image.url
            }
          end
        }
      }
    }
  end

  def empty_data_format(country)
    {
      data: {
        id: nil,
        type: 'learning_resource',
        attributes: {
          country:,
          video: {},
          images: []
        }
      }
    }
  end
end
