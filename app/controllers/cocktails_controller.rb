class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
        format.json { render :show, status: :created, location: @cocktail }
      else
        format.html { render :new }
        format.json { render json: @cocktail.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
