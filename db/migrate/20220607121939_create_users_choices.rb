class CreateUsersChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :users_choices do |t|
      t.references :item, null: false, foreign_key: true
      t.references :basket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
