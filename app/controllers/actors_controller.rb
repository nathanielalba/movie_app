class ActorsController < ApplicationController
  def index
  	@actors = Actor.all
  end

  def show
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
