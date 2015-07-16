class Photo < ActiveRecord::Base
  validates :title, presence: true
  validates :photographer_id, presence: true
  has_and_belongs_to_many :albums

  # Determines if a photo exists in many albums
  #
  # Returns true/false Boolean
  def top_photo?
    if self.albums.length >= 3
      true
    else
      false
    end
  end
end