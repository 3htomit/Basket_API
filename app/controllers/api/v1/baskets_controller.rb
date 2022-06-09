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

      def create
        new_basket = Basket.new()
        params.require(:item_ids).each do |item_id|
          UsersChoice.create(basket: new_basket, item_id: item_id.to_i)
        end

        if new_basket.save
          render json: BasketRepresenter.new(new_basket).as_json, status: :created
        else
          render json: new_basket.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
