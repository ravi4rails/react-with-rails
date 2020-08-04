class Recipe < ApplicationRecord
  validates :name, :ingredients, :instruction, presence: true
end
