class Video < ApplicationRecord
  belongs_to :series
  mount_uploader :video, VideoUploader
  validates :name, presence: true, 
            length:  {in: 3..20}, 
            format: { with: /\A[a-zA-Z0-9_ ]+\z/, message: 'letters and numbers with space' }
  validates :video, presence: true,  on: :create

  process_in_background :video
  store_in_background :video
end
