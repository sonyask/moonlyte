module ApplicationHelper
  
  # display's the object if it is not nill
  def display(obj)
    if obj.nil?
      return "N/A"
    else
      return obj
    end
  end
    
end
