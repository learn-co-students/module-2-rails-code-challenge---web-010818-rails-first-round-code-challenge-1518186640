class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true
  validates :super_name, :name, :superpower_id, presence: true
end
