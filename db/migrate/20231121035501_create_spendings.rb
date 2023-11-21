class CreateSpendings < ActiveRecord::Migration[7.1]
  def change
    create_table :spendings do |t|
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
