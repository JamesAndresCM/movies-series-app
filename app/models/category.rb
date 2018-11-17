class Category < ApplicationRecord
  include Concerns::CapitalizeName
  has_many :series, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_validation :capitalize

  def should_generate_new_friendly_id?
    name_changed?
  end
end
