class User < ApplicationRecord
  attr_reader :remember_token
  before_save :email_downcase

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

  validates :name, presence: true,
    length: {maximum: Settings.user.name.max_name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.user.email.max_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.user.password.min_password}, allow_nil: true
  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    remember_token = User.new_token
    update_attributes remember_digest: User.digest(remember_token)
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false unless digest.present?
    Bcrypt::Password.new(digest).is_password? token
  end

  def forget
    update_attributes remember_digest: nil
  end

  private

  def email_downcase
    email.downcase!
  end
end
