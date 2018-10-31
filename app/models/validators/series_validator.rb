# frozen_string_literal: true

module Validators
  module SeriesValidator
    extend ActiveSupport::Concern
    included do
      validates :name, presence: true, uniqueness: true,
                       length: { in: 3..100 },
                       format: { with: /\A[a-zA-Z0-9_ ]+\z/,
                                 message: 'letters and numbers with space' }
      validates_presence_of :release_date
      validates :description, presence: true, length: { in: 3..300 }
      validates :img, file_size: { less_than: 2.megabytes }
    end
  end
end
