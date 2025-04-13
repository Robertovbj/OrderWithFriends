class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups, id: :uuid do |t|
      t.string :name, limit: 30, null: false
      t.belongs_to :owner, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.boolean :is_public, default: false, null: false

      t.timestamps
      t.datetime :deleted_at, null: true, index: true
    end
  end
end
