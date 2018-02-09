class Superhero < ApplicationRecord
  belongs_to :superpower

  validates :super_name, :uniqueness => true
  # I chose not to require the :name because we might not know a super hero's real name
  validates :superpower_id, :super_name, :presence => true

  def superpower_name
    self.superpower.name
  end

  def self.search_by_superpower(search_term)
    self.all.select do |superhero|
      superhero.superpower_name.downcase.include?(search_term.downcase)
    end
  end
end
