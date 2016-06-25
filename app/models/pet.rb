# Pet
class Pet < ActiveRecord::Base
  # Must have a unique name
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
end
