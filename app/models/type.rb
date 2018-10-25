class Type < ApplicationRecord
  has_one :serie, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  before_validation :capitalize

  def capitalize
    self.name = self.name.capitalize if self.name?
  end
end
