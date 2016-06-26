# Pet class
class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :species

  before_validation :set_initial_hunger, on: :create

  # Must have a unique name
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }
  # Must have a species
  validates_associated :species
  # Hunger must be between 0 and 1
  validates :hunger, inclusion: 0..1
  # Must have a date and time when last fed
  validates :last_fed, presence: true

  private

  def set_initial_hunger
    self.hunger = 0
    self.last_fed = DateTime.current
  end
end
