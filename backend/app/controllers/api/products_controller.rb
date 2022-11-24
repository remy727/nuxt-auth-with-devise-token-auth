# frozen_string_literal: true

module Api
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
      products = Product.all

      render(json: products)
    end
  end
end
