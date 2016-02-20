require 'csv'

class ProductController < ApplicationController

  # before_action do
  #     @products = []
  #     CSV.foreach(Rails.root + "mf_inventory.csv", headers: true) do |row|
  #
  #       product = Product.new
  #       product.pid = row.to_hash["pid"]
  #       product.item = row.to_hash["item"]
  #       product.description = row.to_hash["description"]
  #       product.price = row.to_hash["price"]
  #       product.condition = row.to_hash["condition"]
  #       product.dimension_w = row.to_hash["dimension_w"]
  #       product.dimension_l = row.to_hash["dimension_l"]
  #       product.dimension_h = row.to_hash["dimension_h"]
  #       product.img_file = row.to_hash["img_file"]
  #       product.quantity = row.to_hash["quantity"]
  #       product.category = row.to_hash["category"]
  #
  #       @products << product
  #   end
  # end

  def list
    @products = fetch_products
  end

  def view
    @products = fetch_products
    @product = @products.find { |x| (x.pid).to_i  == params[:id]}
  end

  def fetch_products
    @products = []
    CSV.foreach(Rails.root + "mf_inventory.csv", headers: true) do |row|
      product = Product.new
      product.pid = row.to_hash["pid"]
      product.item = row.to_hash["item"]
      product.description = row.to_hash["description"]
      product.price = row.to_hash["price"]
      product.condition = row.to_hash["condition"]
      product.dimension_w = row.to_hash["dimension_w"]
      product.dimension_l = row.to_hash["dimension_l"]
      product.dimension_h = row.to_hash["dimension_h"]
      product.img_file = row.to_hash["img_file"]
      product.quantity = row.to_hash["quantity"]
      product.category = row.to_hash["category"]
      @products << product
    end
    @products
  end
end