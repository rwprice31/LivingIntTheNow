mycclass User < ApplicationRecord
    belongs_to :store, :foreign_key => "store_id"
    accepts_nested_attributes_for :store
    has_and_belongs_to_many :position
    has_many :schedule
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
