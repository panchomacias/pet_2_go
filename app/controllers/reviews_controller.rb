class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = current_user
    @offer = Offer.find(params[:offer_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to offer_bookings_path
    else
    render :new; status :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
		@review.destroy
		redirect_to offer_bookings_path
  end

  private
  def review_params # tiene que llamarse como el modelo_params
	  params.require(:reviews).permit(:rating, :comment)
  end

end
