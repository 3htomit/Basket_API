class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.float :total, default: 0
      t.float :discount, default: nil
      t.float :shipment, default: nil

      t.timestamps
    end
  end
end
