class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index'
  end

  def new
    @product = Product.new
    render 'new'
  end

  def create
    @product = Product.create(strong)
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(strong)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end


  private

  def strong
    params.require(:product).permit(:name, :price, :desc)
  end


end
