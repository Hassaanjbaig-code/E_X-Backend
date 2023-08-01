class Product < ApplicationRecord
    validates :title, :category, :price, :image_url, presence: true
    belongs_to :user
    has_many :cart
end
