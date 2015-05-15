class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :title
      t.integer :money

      t.timestamps null: false
    end
  end
end
