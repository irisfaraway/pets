# Pet species
class Species < ActiveRecord::Base
  before_validation :set_images

  # Must have a unique name
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  def set_images
    set_normal_image
  end

  # Get path for normal image
  def set_normal_image
    self.image_normal = 'pets/' + name.downcase + '.png'
  end
end
