class Store < ApplicationRecord
    belongs_to :user
    validates :name , presence: true 
    has_many :products
end
