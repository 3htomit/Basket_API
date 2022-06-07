class CreateBaskets < ActiveRecord::Migration[7.0]
  def change
    create_table :baskets do |t|
      t.integer :total

      t.timestamps
    end
  end
end
