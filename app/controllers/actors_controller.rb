class ActorsController < ApplicationController

  def search
    if params[:search].present?
      @actors = Actor.search(params[:search])
    else
      @actors = Actor.all
    end
  end

  def index
  	@actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
  	@actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      flash[:success] = "#{@actor.name} was successfully added!"
      redirect_to actors_path
    else
      render 'new'
    end
  end

  def edit
  end

  private

    def actor_params
      params.require(:actor).permit(:name, :bio, :age, :image)
    end
end
