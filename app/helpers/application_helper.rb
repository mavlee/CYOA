module ApplicationHelper
  def setTitleBasedOnPage
    base_title = "CYOA"
    
    if @title.nil?
      base_title
    else
        "#{base_title} | #{@title}"
    end
  end
end
