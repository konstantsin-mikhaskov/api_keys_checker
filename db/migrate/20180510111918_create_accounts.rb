class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :email_service, index: true
      t.belongs_to :shop, index: true
      t.string :name
      t.string :password
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end
