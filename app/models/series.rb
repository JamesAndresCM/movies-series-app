class Series < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :img, ImageUploader

  belongs_to :category
  belongs_to :type
  has_many :videos, inverse_of: :series, dependent: :destroy
  has_many :tags, inverse_of: :series, dependent: :destroy

  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: proc {|attribute| attribute['name'].nil? }

  validates :name, presence: true, uniqueness: true, length:  {in: 3..100}, format: { with: /\A[a-zA-Z0-9_ ]+\z/, message: 'letters and numbers with space' }
  validates_presence_of :release_date
  validates :description, presence: true, length:  {in: 3..300}
  before_validation :capitalize


  scope :get_data_letter, -> (letter) { where("series.name ilike (?)","#{letter}%") }
  scope :get_by_category, -> (category) { joins(:category).where("categories.slug = (?)","#{category}").sort_by(&:name) }
  scope :order_data, -> () { order(created_at: :desc) }


  def should_generate_new_friendly_id?
    name_changed?
  end

  def capitalize
    self.name = self.name.capitalize if self.name?
  end
end
