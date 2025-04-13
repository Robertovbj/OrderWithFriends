class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false, limit: 100
      t.string :login, null: false, limit: 50
      t.string :password_digest, null: false
      t.string :profile_picture, null: true
      t.index :login, unique: true

      t.timestamps
      t.datetime :deleted_at, null: true, index: true
    end
  end
end
