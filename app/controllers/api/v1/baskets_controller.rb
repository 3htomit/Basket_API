module Api
  module V1
    class BasketsController < ApplicationController
      def index
        baskets = Basket.all

        render json: BasketsRepresenter.new(baskets).as_json
      end

      def show
        basket = Basket.find(params[:id])

        render json: BasketRepresenter.new(basket).as_json
      end
    end
  end
end
