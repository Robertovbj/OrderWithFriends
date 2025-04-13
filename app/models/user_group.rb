class UserGroup < ApplicationRecord
  acts_as_paranoid

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :group_role_id, presence: true

  belongs_to :group, optional: false
  belongs_to :user, optional: false
  belongs_to :group_role, optional: false
end
