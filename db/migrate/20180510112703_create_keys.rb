class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.belongs_to :account, index: true
      t.string :access_key_id
      t.string :secret_access_key
      t.datetime :expired_at, null: true
      t.datetime :last_check_at

      t.timestamps
    end
  end
end
