module Concerns::CapitalizeName
  extend ActiveSupport::Concern
    def capitalize
      self.name = self.name.capitalize if self.name?
    end 
end