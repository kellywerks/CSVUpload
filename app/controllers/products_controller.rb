class ProductsController < ApplicationController
  before_filter :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
    render 'index'
  end

  def new
    @product = Product.new
    render 'new'
  end

  def create
    @product = Product.new(strong)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(strong)
      redirect_to product_path(@product)
    else
      render 'edit'
    end
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
