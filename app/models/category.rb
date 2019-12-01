class Category < ApplicationRecord

  has_many :recipe_categories
  has_many :recipes, through: :recipe_categories

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 30}

end