module ApplicationHelper
	def nav_title(object)
		case object
    when :movie then "link_to 'New Movie', new_movie_path, class: 'active'"
    when :actor then "link_to 'New Actor', new_actor_path, class: 'active'"
		end
	end
end
