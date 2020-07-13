class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :category
      t.string :name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
