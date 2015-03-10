module Subscribem
  class Role < ActiveRecord::Base
    has_and_belongs_to_many :subscribem_users, :join_table => :subscribem_users_roles
    belongs_to :resource, :polymorphic => true

    validates :resource_type,
              :inclusion => { :in => Rolify.resource_types },
              :allow_nil => true

    scopify
  end
end
