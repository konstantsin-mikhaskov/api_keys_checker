class CreateEmailServices < ActiveRecord::Migration[5.0]
  def change
    create_table :email_services do |t|
      t.string :name
      t.string :password
      t.string :domain

      t.timestamps
    end
  end
end
