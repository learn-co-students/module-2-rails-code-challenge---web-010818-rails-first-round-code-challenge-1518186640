class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true


  def self.search(search)
    Superhero.where("superpower_id = #{search}")
  end
end
