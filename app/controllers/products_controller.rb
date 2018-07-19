class ProductsController < ApplicationController
  before_action :js_authenticate_user!, only: [:like_movie]
  before_action :authenticate_user! 
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
     @user_likes_product = Like.where(user_id: current_user.id, product_id: @product.id).first if user_signed_in?
     session[:user_like] =  @user_likes_product
  end

  # GET /products/new
  def new
    @product = Product.new
    
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def new_map
  end
  def create_map
        u1 = Product.new
        u1.latitude =  session[:map_lat]
        u1.longitude = session[:map_lng]
        u1.area_name = params[:area_name]
        u1.address = params[:address]
        u1.save
        redirect_to "/"
  end
  
  def like_product
    #현재 유저와 params에 담긴 movie간의 좋아요 관계를 설정한다.
    @like = Like.where(user_id: current_user.id, product_id: params[:product_id]).first
    if @like.nil?
       @like=Like.create(user_id: current_user.id,product_id: params[:product_id])
    else
        @like.destroy
    #만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    #해당 Like 인스턴스 삭제
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:area_type,:area_name,:address,:latitude,:longitude,:description,:image_address)
    end
end