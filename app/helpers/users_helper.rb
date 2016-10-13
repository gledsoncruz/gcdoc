module UsersHelper

	def active(status)
		if status
			content_tag(:span, 'Ativado', class: 'label label-success')
		else
			content_tag(:span, 'Desativado', class: 'label label-danger')
		end
	end


end
