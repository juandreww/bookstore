class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.name_prefix
    @product.save!
  end

  def create_food
    @food = Product::Models::Food.new(product_params)
    @food.name_prefix
    @food.save!
  end

  private

  def product_params
    params.require(:product)
          .permit(:name)
  end
end
