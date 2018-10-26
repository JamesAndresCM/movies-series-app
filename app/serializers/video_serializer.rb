class VideoSerializer < ActiveModel::Serializer
  attributes :id, :video, :name, :duration, :resolution
end
