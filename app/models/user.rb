class User < ApplicationRecord
    include ActiveModel::SecurePassword
    has_secure_password
    has_many :product
    has_many :cart

    # attr_accessor :password_digest
end
