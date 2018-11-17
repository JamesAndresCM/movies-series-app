class Type < ApplicationRecord
  include Concerns::CapitalizeName
  has_many :series, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  before_validation :capitalize
end
