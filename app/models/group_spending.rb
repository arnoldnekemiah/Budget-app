class GroupSpending < ApplicationRecord
    belongs_to :spendings
    belongs_to :groups
end
