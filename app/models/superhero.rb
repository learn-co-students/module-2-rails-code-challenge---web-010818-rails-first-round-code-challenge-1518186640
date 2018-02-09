class Superhero < ApplicationRecord
  belongs_to :superpower

  validates :name, uniqueness: true
end
