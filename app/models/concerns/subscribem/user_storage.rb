module Subscribem
  module UserStorage

    extend ActiveSupport::Concern

    included do
      self.table_name = "subscribem_users"
    end

  end
end