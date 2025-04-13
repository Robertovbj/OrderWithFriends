class Group < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true, length: { maximum: 100 }, uniqueness: { case_sensitive: false }
  validates :is_public, presence: true, inclusion: { in: [ true, false ] }
  validates :owner_id, presence: true

  belongs_to :owner, optional: false, class_name: "User", foreign_key: "owner_id"
  has_many :users, through: :user_groups
  has_many :user_groups, dependent: :destroy
end
