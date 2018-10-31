# frozen_string_literal: true

class Series < ApplicationRecord
  include Concerns::CapitalizeName
  include Validators::SeriesValidator

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :img, ImageUploader

  belongs_to :category
  belongs_to :type
  has_many :videos, inverse_of: :series, dependent: :destroy
  has_many :tags, inverse_of: :series, dependent: :destroy

  accepts_nested_attributes_for :videos, allow_destroy: true
  accepts_nested_attributes_for :tags, allow_destroy: true,
                                       reject_if: proc { |attr| attr['name'].nil? }
  before_validation :capitalize
  scope :order_data, -> { order(created_at: :desc) }

  def self.type_attr_serie(type, value)
    case type
    when 'letter'
      where('name ilike (?)', "#{value}%")
    when 'name'
      where('name ilike (?)', "%#{value}%")
    else
      false
    end
  end

  def self.get_by_category(category)
    joins(:category)
      .where('categories.slug = (?)', category.to_s).sort_by(&:name)
  end

  def should_generate_new_friendly_id?
    name_changed?
  end
end
