class Request < ApplicationRecord
  has_many :requests, dependent: :destroy
  belongs_to :type_request
end
