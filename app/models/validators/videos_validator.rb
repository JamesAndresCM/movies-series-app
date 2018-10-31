module Validators
  module VideosValidator
    extend ActiveSupport::Concern
    included do
      validates :name, presence: true,
                       length: { in: 3..20 },
                       format: { with: /\A[a-zA-Z0-9_ ]+\z/,
                                 message: 'letters and numbers with space' }
      validates :video, presence: true, on: :create
    end
  end
end
