class Dose < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :ingredient, :inverse_of => :dose
  accepts_nested_attributes_for :ingredient
  validates :description, presence: true
  validates :cocktail_id, presence: true
  validates :ingredient_id, presence: true
  validates :cocktail_id, :uniqueness => { :scope => :ingredient_id }
end
