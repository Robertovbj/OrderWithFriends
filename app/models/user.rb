class User < ApplicationRecord
    acts_as_paranoid
    has_secure_password

    validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
    validates :login, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    validates :profile_picture, format: { with: /\A.*\.(jpg|jpeg|png|gif)\z/i, message: "must be a valid image format (jpg, jpeg, png, gif)" }, allow_blank: true
    validates :password, presence: true, on: :create
    validates :password, length: { minimum: 8 }, format: { with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d).*\z/,
                                message: "must include uppercase, lowercase and numeric characters" },
                        if: -> { password.present? }

    has_many :groups, foreign_key: "owner_id", dependent: :destroy
    has_many :user_groups, dependent: :destroy
end
