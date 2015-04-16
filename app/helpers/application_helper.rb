module ApplicationHelper
  def side_styles
    Style.order(:name)
  end

  def recently_commented
    Comment.order(created_at: :desc).limit(7)
  end

  def recent_beers
    Beer.order(created_at: :desc)
  end

  def last_comment_author(beer_id)
    Beer.find(beer_id).comments.last.author
  end
end
