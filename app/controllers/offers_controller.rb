class OffersController < ApplicationController

  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @user = current_user
    @offer.user_id = @user.id
    if @offer.save
      redirect_to offers_path, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update(offer_params)
      redirect_to @offer, notice: 'Offer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to offers_path, notice: 'Offer was successfully destroyed.'
  end

  private

  def offer_params
    params.require(:offer).permit(:description, :price, :calendar)
  end

  def set_offer
    @offer = Offer.find(params[:id])
  end
end
