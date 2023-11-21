class CreateGroupSpendings < ActiveRecord::Migration[7.1]
  def change
    create_table :group_spendings do |t|

      t.timestamps
    end
  end
end
