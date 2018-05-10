class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :domain
      t.string :api_domain

      t.timestamps
    end
  end
end
