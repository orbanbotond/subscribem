class AddConfirmedAtToUsers < ActiveRecord::Migration
  def change
    add_column :subscribem_users, :confirmed_at, :timestamp
    add_column :subscribem_users, :confirmation_token, :string
    add_column :subscribem_users, :confirmation_sent_at, :timestamp
    add_column :subscribem_users, :unconfirmed_email, :string
  end
end
