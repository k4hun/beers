class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
end
