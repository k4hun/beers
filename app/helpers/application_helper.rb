module ApplicationHelper
  def side_styles
    Style.order(:name)
  end

  def recently_commented
    Beer.order(:name).limit(7)
  end
end
