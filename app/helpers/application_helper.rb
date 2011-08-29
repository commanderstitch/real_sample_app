module ApplicationHelper

  # Return a title on a per-page basis
  def title
    base_title = "Ruby on Rails tutorial Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("Selection_005.png", :alt => "Sample App Image",:class => "round")
  end
end
