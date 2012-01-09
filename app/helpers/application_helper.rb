module ApplicationHelper
  def setTitleBasedOnPage
    base_title = "Branch It Out"

    if @title.nil?
      base_title
    else
        "#{ @title } | #{ base_title }"
    end
  end
end
