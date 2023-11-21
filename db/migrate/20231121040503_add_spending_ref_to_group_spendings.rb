class AddSpendingRefToGroupSpendings < ActiveRecord::Migration[7.1]
  def change
    add_reference :group_spendings, :spending, null: false, foreign_key: true
  end
end
