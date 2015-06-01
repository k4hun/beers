class Style < ActiveRecord::Base
  has_many :beers
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
