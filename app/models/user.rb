class User < ApplicationRecord
    has_many :recipes, foreign_key: 'user_id'
end