module ApplicationHelper
  def side_styles
    Style.order(:name)
  end

  def recently_commented
    Style.order(:name).limit(7)
  end
end
