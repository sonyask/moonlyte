module ApplicationHelper
  
  # display's the object if it is not nill
  def display(obj)
    if obj.nil?
      return "N/A"
    else
      return obj
    end
  end
  
  # display the title
  def title
    baseTitle = "Moonlyt"
    if @title.nil?
      return baseTitle
    else
      return "#{baseTitle}: #{@title}"
    end
  end
  
  # find active page
  def highlight_current(path)
    if current_page?(path)
      return "navcurrent"
    end
  end
    
end
