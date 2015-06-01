class Brewery < ActiveRecord::Base
  has_many :beers
  has_attached_file :logo, styles: { thumb: '150x150>' }

  validates_attachment_content_type :logo,
                                    content_type: /^image\/(png|gif|jpeg)/,
                                    message: 'Wrong file type! Use PNG, JPEG or GIF.'

  validates_attachment_size :logo,
                            in: 0..250.kilobytes,
                            message: 'Image size too big. Max size: 250kB'

  validates :name, presence: true
end
