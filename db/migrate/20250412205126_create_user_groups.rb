class CreateUserGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :user_groups, id: :uuid do |t|
      t.references :group, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :group_role, null: false, foreign_key: true, type: :uuid

      t.timestamps
      t.datetime :deleted_at, null: true, index: true
    end
  end
end
