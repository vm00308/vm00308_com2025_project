class Recipe < ApplicationRecord

  validates :name, presence: true, length: {minimum: 5, maximum: 75}
  validates :description, presence: true, length: {minimum: 10, maximum: 5000}

end