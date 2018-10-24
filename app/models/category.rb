class Category < ApplicationRecord
  has_many :series, dependent: :destroy
  validates_presence_of :name, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged

  before_validation :capitalize

  def capitalize
    self.name = self.name.capitalize if self.name?
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
