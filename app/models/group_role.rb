class GroupRole < ApplicationRecord
    acts_as_paranoid

    validates :description, presence: true, uniqueness: { case_sensitive: true }

    has_many :user_groups, dependent: :destroy
    has_many :groups, through: :user_groups
    has_many :users, through: :user_groups
end
