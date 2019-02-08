module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks


    settings do
      mappings dynamic: false do
        indexes :name, type: :text
        indexes :description, type: :text
      end
    end

    def self.search_serie(query)
      self.search({
        query: {
          multi_match: {
            query: query,
            fields: [:name, :description]
          }
        }
      })
    end

    def as_indexed_json(options = {})
      as_json(only: [:name,:slug,:description,:id,:img], 
        include: { 
          category: { only: :name},
          type: { only: :name }
      })
    end
  end
end