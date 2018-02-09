class Superhero < ActiveRecord::Base
  belongs_to :superpower
  #validates :name, uniqueness: true
  validates :super_name, uniqueness: true
end
