module Api
  module V1
    class ItemsController < ApplicationController
      def index
        items = Item.all

        render json: ItemsRepresenter.new(items).as_json
      end

      def show
        item = Item.find(params[:id])

        render json: ItemRepresenter.new(item).as_json
      end

      def create
        new_item = Item.new(item_params)

        if new_item.save
          render json: ItemRepresenter.new(new_item).as_json, status: :created
        else
          render json: new_item.errors, status: :unprocessable_entity
        end
      end

      private

      def item_params
        params.require(:item).permit(:price, :quantity)
      end
    end
  end
end
