class Store < ApplicationRecord
    has_many :user, dependent: :destroy
    has_many :position, dependent: :destroy
end
