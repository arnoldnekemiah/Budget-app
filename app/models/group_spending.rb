class GroupSpending < ApplicationRecord
  belongs_to :spending
  belongs_to :group
end
