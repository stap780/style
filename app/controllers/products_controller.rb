class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
     @search = Product.ransack(params[:q]) #используется gem ransack для поиска и сортировки
    @search.sorts = 'id asc' if @search.sorts.empty? # сортировка таблицы по алфавиту по умолчанию 
    
    @products = @search.result.paginate(page: params[:page], per_page: 50)
    @allproducts = Product.all #where("title IS NOT NULL").order(:id).limit(10000)
    respond_to do |format|
      format.html
      format.csv do
      headers['Content-Disposition'] = "attachment; filename=\"product.csv\""
      headers['Content-Type'] ||= 'text/csv'
      end
      format.json
    end  
  end

  # GET /products/1
  # GET /products/1.json
  def show
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
  
  def import
    Product.import(params[:file])
    redirect_to products_url, notice: "Products imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:foto, :sku, :collection, :complect, :proba, :title, :category, :gruppa, :vstavka, :metalcolor, :size, :price, :quantity, :weight)
    end
end
