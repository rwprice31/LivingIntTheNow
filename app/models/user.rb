class User < ApplicationRecord
    belongs_to :store
    has_and_belongs_to_many :position
    has_many :schedule
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
