class Comedian < ApplicationRecord
  has_many :specials

  validates_presence_of :name
  validates_presence_of :age
  validates_presence_of :city
  validates_presence_of :image

  def self.by_age(age)
    Comedian.where(age: age)
  end

  def specials_count
    self.specials.count
  end
end
