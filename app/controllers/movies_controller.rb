class MoviesController < ApplicationController
	def welcome
	end

  def index
  	@movies = Movie.all
    @title = "Movies"
  end

  def new
  	@movie = Movie.new
  end

  def create
  	@movie = Movie.new(movie_params)

  	if @movie.save
  		flash[:notice] = "#{@movie.title} was successfully created!"
  		redirect_to movies_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def show
  end

  private

  	def movie_params
  		params.require(:movie).permit(:title, :description, :runtime, :image)
  	end
end
