class Type < ApplicationRecord
  has_one :serie, dependent: :destroy

  before_validation :capitalize

  def capitalize
    self.name = self.name.capitalize if self.name?
  end
end
