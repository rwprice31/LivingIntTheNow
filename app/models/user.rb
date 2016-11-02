class User < ApplicationRecord
    belongs_to :store
    has_and_belongs_to_many :position
    has_many :schedule
end
