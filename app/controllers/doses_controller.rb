class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    respond_to do |format|
      if @dose.save
        format.html { redirect_to @cocktail, notice: 'Dose was successfully created.' }
        format.json { render :show, status: :created, location: cocktail_dose_path(@cocktail, @dose) }
      else
        format.html { render :new }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
