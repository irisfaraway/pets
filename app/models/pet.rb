# Pet class
class Pet < ActiveRecord::Base
  before_validation :set_initial_hunger

  # Must have a unique name
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  # Hunger must be between 0 and 1
  validates :hunger, inclusion: 0..1

  private

  def set_initial_hunger
    self.hunger = 0
  end
end
