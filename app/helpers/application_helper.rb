# Methods added to this helper will be available to all templates in the application.

# You can extend refinery with your own functions here and they will likely not get overriden in an update.
module ApplicationHelper
 	include Refinery::ApplicationHelper # leave this line in to include all of Refinery's core helper methods.
  	# Display a Snipplet in a Template
	# 
	# Create a page hidden in the menu
	# and call it via : get_snipplet('about-me')
 	def get_snipplet(snip)

 		# TODO: Move to Model
 		snipplet = Page.find(snip, :include => [:parts], :conditions => ["page_parts.title = ?", 'Body'], :limit => 1) 
		
		@side_box = content_tag(:h3, snipplet[:title])
  	 	@side_box << snipplet[:body]

		# Write in the page
		#@side_box << "<a href=''>Learn more...</a>"
	end 
end
