class Video < ApplicationRecord
  belongs_to :series
  mount_uploader :video, VideoUploader
  include Validators::VideosValidator
  process_in_background :video
  store_in_background :video
end
