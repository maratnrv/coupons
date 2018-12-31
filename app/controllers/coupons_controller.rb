class CouponsController < ApplicationController
  before_action :set_coupon, only: [:show, :print_version, :edit, :update, :destroy, :ss_coupon]
  before_action :authenticate_admin, only: [:index, :edit, :destroy]
  before_action :authenticate_user, only: [:show, :my_coupons]

  # GET /coupons
  # GET /coupons.json
  def index
    @coupons = Coupon.all.order(:day)
  end

  # GET /coupons/1
  # GET /coupons/1.json
  def show
    if !@coupon.enabled?
      @coupon.enabled = true
      @coupon.save!
      notice = "Congratulations, you've got new coupon"
    else
      notice = nil
    end
  end

  def print_version
  end

  def come_back_later

  end

  def my_coupons
    @coupons = Coupon.where(enabled: true).order(:day)
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

  def ss_coupon
    coupon_params
    @coupon.comment = params[:coupon][:comment]
    @coupon.used = true
    @coupon.save!
    #UserMailer.use_coupon(@coupon).deliver_now
    redirect_to coupon_path(@coupon)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_coupon
    @coupon = Coupon.find_by(uid: params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def coupon_params
    params.require(:coupon).permit(:name, :content, :code_url, :uid, :day, :usable, :used, :enabled, :comment)
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |id, password|
      id == 'marat' && password == 'qwe123RT!'
    end
  end

  def authenticate_user
    authenticate_or_request_with_http_basic do |id, password|
      (id == 'albina' && password == '07102004') || (id == 'marat' && password == 'qwe123RT!')
    end
  end
end
