class Photographer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :photos
end