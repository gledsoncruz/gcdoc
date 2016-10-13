module ApplicationHelper

	def link_menu(text, link, icon, options={})
		link_to(link, options) do
      concat(content_tag(:i, '', class: icon))
      concat(content_tag(:span, text))
	   end
	end

end
