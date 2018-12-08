class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:edit, :destroy]
  before_action :authenticate_user, only: [:get_coupon]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
  end

  def take
    uid = params.require(:uid)
    if uid.blank?
      render plain: 'error'
    else
      @coupon = Coupon.find_by(uid: uid)
      redirect_to @coupon
    end
  end

  def take_coupon
    uid = params.require(:uid)
    if uid.blank?
      render plain: 'error'
    else
      @coupon = Coupon.find_by(uid: uid)
    end
  end

  # GET /coupons/new
  def new
    @coupon = Coupon.new
  end

  # GET /coupons/1/edit
  def edit
  end

  # POST /coupons
  # POST /coupons.json
  def create
    @coupon = Coupon.new(coupon_params)


    if @coupon.save
      redirect_to @coupon, notice: 'Coupon was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /coupons/1
  # PATCH/PUT /coupons/1.json
  def update
    if @coupon.update(coupon_params)
      redirect_to @coupon, notice: 'Coupon was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /coupons/1
  # DELETE /coupons/1.json
  def destroy
    @coupon.destroy
    redirect_to coupons_url, notice: 'Coupon was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coupon
    @coupon = Coupon.find_by(uid: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coupon_params
    params.require(:coupon).permit(:name, :content, :code_url, :uid, :day, :usable, :used, :enabled)
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |id, password|
      id == 'marat' && password == 'qwe123RT!'
    end
  end
end
