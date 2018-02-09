class Superhero < ApplicationRecord
  has_many :superpowers
  validates :name, presence: true
  validates :name, uniqueness: true

end
