class User < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name, foreign_key:
    :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :passive_relationships, class_name: Relationship.name, foreign_key:
    :followed_id, dependent: :destroy, inverse_of: :followed
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  belongs_to :division
  belongs_to :position
end
