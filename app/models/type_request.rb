class TypeRequest < ApplicationRecord
  has_many :requests, dependent: :destroy
end
