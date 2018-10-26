class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :img, :release_date, :description
  has_many :videos
  has_many :tags
  belongs_to :category
  belongs_to :type
end
