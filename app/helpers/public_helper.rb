module PublicHelper
  def short_desc(desc)
    desc.truncate(30, omission: '...')
  end

  def rating_stars(rating)
    stars = []
    rating.times do
      stars << image_tag('rate_star.png', size: "20x20")
    end
    stars
  end
end
