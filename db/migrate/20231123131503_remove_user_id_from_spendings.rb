class RemoveUserIdFromSpendings < ActiveRecord::Migration[7.1]
  def change
    remove_reference :spendings, :user, null: false, foreign_key: true
  end
end
