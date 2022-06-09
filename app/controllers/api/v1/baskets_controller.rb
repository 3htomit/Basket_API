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
        new_basket = Basket.new(options_params)
        create_users_choices(params.require(:item_ids), new_basket) unless params.require(:item_ids).size.zero?
        new_basket.total = calculate_total(
          new_basket.items,
          discount: new_basket.discount,
          shipment: new_basket.shipment
        )

        if new_basket.save
          render json: BasketRepresenter.new(new_basket).as_json, status: :created
        else
          render json: new_basket.errors, status: :unprocessable_entity
        end
      end

      private

      def options_params
        params.require(:options).permit(:discount, :shipment)
      end

      def create_users_choices(item_ids, new_basket)
        item_ids.each do |item_id|
          UsersChoice.create(basket: new_basket, item_id: item_id.to_i)
        end
      end

      def calculate_total(items, **options)
        total = 0
        vat = 1.1
        items.each do |item|
          total += item.price * item.quantity
        end
        if total.zero?
          total=0
        else
          total *= (1 - options[:discount])
          total *= vat
          total += options[:shipment]
        end
        total = total.round(2)
      end
    end
  end
end
