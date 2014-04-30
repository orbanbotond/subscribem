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

require 'spec_helper'

describe Subscribem::Account do
  it "can be created with an owner" do
    params = {
      :name => "Test Account",
      :subdomain => "test",
      :owner_attributes => {
        :email => "user@example.com",
        :password => "password",
        :password_confirmation => "password"
      }
    }
    account = Subscribem::Account.create_with_owner(params)
    expect(account).to be_persisted
    expect(users.first.should).to eql(account.owner)
  end
  it "cannot create an account without a subdomain" do
    account = Subscribem::Account.create_with_owner
    expect(account).not_to be_valid
    expect(account.users).not_to be_empty
  end
end
