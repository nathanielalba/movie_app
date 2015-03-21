class SearchController < ApplicationController
	before_action :set_actors
	before_action :set_movies

	def index
		@search = []
		@search.concat(@actors)
		@search.concat(@movies)
	end


	private

		def set_actors
			if params[:index].present?
				result = Actor.search(params[:index])
				if result.empty?
					@actors = []
				else
					@actors = result 
				end
			else
				@actors = Actor.all
			end
		end

		def set_movies
			if params[:index].present?
				result = Movie.search(params[:index])
				if result.empty?
					@movies = []
				else
					@movies = result 
				end
			else
				@movies = Movie.all
			end
		end
end
