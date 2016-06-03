class Review < ActiveRecord::Base
  belongs_to :cocktail
  validates :cocktail_id, presence: true
  validates :rating, inclusion: { in: (0..5) }, presence: true
  validates :content, presence: true
end
