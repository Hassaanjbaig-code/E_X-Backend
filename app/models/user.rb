class User < ApplicationRecord
    include ActiveModel::SecurePassword
    has_secure_password
    has_many :product
    has_many :cart
    has_many :comment

    validates :name, :email, :password, presence: true

    # validates :name, presence: true
    # validates :email, presence: true
    # validates :password, presence: true

    # attr_accessor :password_digest
end
