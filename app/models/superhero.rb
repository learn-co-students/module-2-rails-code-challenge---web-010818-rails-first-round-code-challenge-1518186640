class Superhero < ApplicationRecord
  has_many :heropowers
  has_many :superpowers, through: :heropowers

  validates :name, uniqueness: {scope: :superpower_id}
end
