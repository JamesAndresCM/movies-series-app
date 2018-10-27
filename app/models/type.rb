class Type < ApplicationRecord
  include Concerns::CapitalizeName
  has_one :serie, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_validation :capitalize
end
