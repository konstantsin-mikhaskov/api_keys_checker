class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.belongs_to :shop, index: true
      t.string :name
      t.string :asin

      t.timestamps
    end
  end
end
