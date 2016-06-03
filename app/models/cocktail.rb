class Cocktail < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, uniqueness: true, presence: true
end

