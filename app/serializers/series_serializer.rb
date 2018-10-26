class SeriesSerializer < ActiveModel::Serializer
  include ActionView::Helpers::SanitizeHelper
  attributes :id, :name, :img, :release_date, :description
  has_many :videos
  has_many :tags
  belongs_to :category
  belongs_to :type

  def description
    strip_tags(object.description.html_safe)
  end
end
