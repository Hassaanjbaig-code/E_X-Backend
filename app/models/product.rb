class Product < ApplicationRecord
    validates :title, :category, :price, :desc, presence: true
    belongs_to :user
    has_many :cart
    has_many_attached :image
end
