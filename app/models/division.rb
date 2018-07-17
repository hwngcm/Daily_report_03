class Division < ApplicationRecord
  has_many :users, dependent: :destroy
end
