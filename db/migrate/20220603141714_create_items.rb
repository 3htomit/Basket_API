class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
