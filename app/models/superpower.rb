class Superpower < ApplicationRecord
  has_many :heropowers
  has_many :superheroes, through: :heropowers
end
