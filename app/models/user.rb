class User < ApplicationRecord
    has_many :product
    has_many :cart
end
