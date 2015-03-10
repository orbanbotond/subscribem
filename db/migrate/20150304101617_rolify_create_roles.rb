class RolifyCreateRoles < ActiveRecord::Migration
  def change
    create_table(:subscribem_roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:subscribem_users_subscribem_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end

    add_index(:subscribem_roles, :name)
    add_index(:subscribem_roles, [ :name, :resource_type, :resource_id ], name: 'index_subscribem_roles_on_name_and_resource_type_and_resourc' )
    add_index(:subscribem_users_subscribem_roles, [ :user_id, :role_id ])
  end
end