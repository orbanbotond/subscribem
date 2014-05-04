# == Schema Information
#
# Table name: subscribem_accounts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  owner_id   :integer
#  subdomain  :string(255)
#

module Subscribem
  class Account < ActiveRecord::Base
    belongs_to :owner, :class_name => "Subscribem::User"
    has_many :members, :class_name => "Subscribem::Member"
    has_many :users, :through => :members

    accepts_nested_attributes_for :owner

    validates :subdomain,
              presence: true,
              uniqueness: true,
              format: { with: /\A[\w\-]+\Z/i, message: 'is not allowed. Please choose another subdomain.'},
              exclusion: { in: %w(admin), message: 'is not allowed. Please choose another subdomain.'}

    validates :name,
              presence: true,
              uniqueness: {scope: :owner_id}

    before_validation do
      self.subdomain = subdomain.to_s.downcase
    end

    def create_schema
      Apartment::Database.create(subdomain)
    end

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
        account.owner.confirm!
      end
      account
    end

  end
end
