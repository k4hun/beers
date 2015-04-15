class Comment < ActiveRecord::Base
  belongs_to :beer

  validates :content, presence: true
  validates :author, presence: true
end
