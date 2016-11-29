class Position < ApplicationRecord
  belongs_to :store
  has_and_belongs_to_many :users
end
