module PagesHelper
  
  # TODO: comment
  def get_snipplet(snip)
    # TODO: I dont need Parts, but on the a title = body
    snipplet = Page.find(snip, :include => [:parts], :conditions => ["page_parts.title = ?", 'Body'], :limit => 1) 
    
	content_tag :h3 do 
      snipplet[:title]
	  content_tag :p do 
        snipplet[:body]
	  end 
	end 
    
  end

end
