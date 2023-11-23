class AddGroupIdToSpendings < ActiveRecord::Migration[7.1]
  def change
    add_reference :spendings, :group, null: false, foreign_key: true
  end
end
