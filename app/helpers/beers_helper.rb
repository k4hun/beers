module BeersHelper
  def short_desc(desc)
    desc.truncate(30, omission: '...')
  end
end
