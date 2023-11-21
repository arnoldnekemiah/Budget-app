class User < ApplicationRecord
    validates :name, presence: true
    
    has_many :spendings, foreign_key: 'author_id'
    has_many :groups
end
