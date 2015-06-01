class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery
  has_many :comments

  has_attached_file :photo, styles: { normal: '800x600>', thumb: '200x150>' }

  validates_attachment_content_type :photo,
                                    content_type: /^image\/(png|gif|jpeg)/,
                                    sage: 'Wrong file type! Use PNG, JPEG or GIF.'

  validates_attachment_size :photo,
                            in: 0..2500.kilobytes,
                            message: 'Image size too big. Max size: 2500kB'

  validates :name, presence: true
  validates :description, presence: true
  validates :style, presence: true
  validates :brewery, presence: true

  scope :latest, -> { order('created_at DESC') }
  scope :by_style, -> (style) { where('style_id = ?', style) }
  scope :by_brewery, -> (brewery) { where('brewery_id = ?', brewery) }
  self.per_page = 3

  def self.search(options = {})
    beers = Beer.all
    beers = Beer.by_style(options[:style_id]) if options[:style_id].present?
    beers = Beer.by_brewery(options[:brewery_id]) if options[:brewery_id].present?
    beers
  end
end
