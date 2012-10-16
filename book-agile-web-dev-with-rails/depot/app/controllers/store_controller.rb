class StoreController < ApplicationController
  def index
    # order is a class method of Product class.
    # this method pulls a full list of the products from the model and puts them in @products
    @products = Product.order(:title)
  end

end
