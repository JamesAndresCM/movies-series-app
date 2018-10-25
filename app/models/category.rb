class Category < ApplicationRecord
  has_many :series, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true, uniqueness: true
  before_validation :capitalize

  def capitalize
    self.name = self.name.capitalize if self.name?
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
