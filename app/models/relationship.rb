class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name,
    inverse_of: :active_relationships
  belongs_to :followed, class_name: User.name,
    inverse_of: :passive_relationships
end
