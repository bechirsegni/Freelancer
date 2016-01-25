module ApplicationHelper

  def full_title(page_title="")
    base_tile="Freelancer Tunisia"
    if page_title.blank?
      base_tile
    else
      "#{page_title} | #{base_tile}"
    end
  end
end
