class Recipe < ApplicationRecord

  belongs_to :user

  has_many :recipe_categories
  has_many :categories, through: :recipe_categories

  validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5, maximum: 75}
  validates :description, presence: true, length: {minimum: 10, maximum: 5000}
  validates :user_id, presence: true

end