class Superpower < ApplicationRecord
  belongs_to :superhero
  validates :name, uniqueness: true 

end
