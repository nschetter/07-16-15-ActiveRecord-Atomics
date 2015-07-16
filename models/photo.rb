class Photo < ActiveRecord::Base
  validates :title, presence: true
  validates :photographer_id, presence: true
  has_and_belongs_to_many :albums
end