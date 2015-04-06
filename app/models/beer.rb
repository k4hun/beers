class Beer < ActiveRecord::Base
  belongs_to :style
  belongs_to :brewery

  has_attached_file :photo, :styles => { :normal => "800x600>", :thumb => "200x150>"}

  validates_attachment_content_type :photo, 
                                    :content_type => /^image\/(png|gif|jpeg)/, 
                                    :message => "Wrong file type! Use PNG, JPEG or GIF."

  validates_attachment_size :photo,
                            :in => 0..2500.kilobytes,
                            :message => "Image size too big. Max size: 2500kB"  

  validates :name, presence: true
  validates :description, presence: true
  validates :style_id, presence: true
  validates :brewery_id, presence: true
end
