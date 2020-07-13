class CreateNutrients < ActiveRecord::Migration[6.0]
  def change
    create_table :nutrients do |t|
      t.string :name
      t.float :amount, default: 0
      t.string :unit
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
