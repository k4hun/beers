class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery

  validates :name, presence: true
  validates :description, presence: true
  validates :style_id, presence: true
  validates :brewery_id, presence: true
end
