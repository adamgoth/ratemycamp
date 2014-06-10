class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @campsite = Campsite.find(params[:campsite_id])
    @review = current_user.reviews.new(:campsite_id => params[:campsite_id])
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @campsite = Campsite.find(params[:campsite_id])
    @review = @campsite.reviews.build(review_params)
    if @review.save
      redirect_to campsite_path(@campsite), notice: 'Review was successfully created.' , class: "alert-info"
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to campsite(@campsite), notice: 'Review was successfully updated.'
    else
      render action: 'edit' 
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
      redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comments, :user_id, :campsite_id)
    end
end
