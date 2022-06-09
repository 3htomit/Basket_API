class Basket < ApplicationRecord
  has_many :users_choices
  has_many :items, through: :users_choices

  before_save :calculate_total

  private

  def calculate_total
    vat = 1.1
    unless self.items.size.zero?
      self.items.each do |item|
        self.total += item.price * item.quantity
      end
    end
    unless self.total.zero?
      self.total *= (1 - (discount || 0))
      self.total *= vat
      self.total += (shipment || 5)
    end
    self.total = self.total.round(2)
  end
end
