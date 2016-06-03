class ReviewsController < ApplicationController
  before_action :find_cocktail

  def new
    @review = Review.new
  end

  def create
    @review = @cocktail.reviews.build(review_params)
      respond_to do |format|
      if @review.save
        format.html { redirect_to @cocktail, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: cocktail_review_path(@cocktail, @review) }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
