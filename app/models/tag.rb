# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :series

  validates_presence_of :name
  before_validation :tag_string

  def tag_string
    self.name = '#' + name.capitalize if name?
  end
end
