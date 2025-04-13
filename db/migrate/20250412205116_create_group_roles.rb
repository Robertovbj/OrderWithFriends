class CreateGroupRoles < ActiveRecord::Migration[8.0]
  def change
    create_table :group_roles, id: :uuid do |t|
      t.string :description, null: false

      t.timestamps
      t.datetime :deleted_at, null: true, index: true
    end

    GroupRole.create!([
      { description: 'Owner' },
      { description: 'Admin' },
      { description: 'Member' }
    ])
  end
end
