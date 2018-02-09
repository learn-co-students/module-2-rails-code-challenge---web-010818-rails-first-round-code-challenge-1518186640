class Superhero < ApplicationRecord
  validates :name, uniqueness: true

  belongs_to :superpower

  def self.search(search)
  where("name LIKE ? OR super_power LIKE ?", "%#{search}%", "%#{search}%")
end
end
