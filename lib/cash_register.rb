require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end
  def add_item(title, price, quanity = 1)
    self.total += price * quanity
    quanity.times do
    @items << title
    end
    self.last_transaction = price * quanity
  end
  def apply_discount
    if self.discount == 0
      total
      return "There is no discount to apply."
    else
      money_off = self.total * @discount / 100.0
      new_total = (@total -= money_off).to_i
      return "After the discount, the total comes to $#{new_total}."
    end
  end

  def void_last_transaction
    self.total = self.last_transaction - self.total
  end
end
