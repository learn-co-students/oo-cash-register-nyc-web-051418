require 'pry'
class CashRegister
  attr_accessor :total, :discount, :previous
  @items

  def initialize(employee_discount = nil)
    self.total = 0
    self.discount = employee_discount.to_f
    @items = []
  end

  def add_item(item, price, quantity = 0)
    self.previous = self.total
    if quantity == 0
      self.total += price
      @items << item
    else
      self.total += price*quantity
      quantity.times do
        @items << item
      end
    end
  end

  def apply_discount
    retStr = ""
    if self.discount == 0.0
      retStr = "There is no discount to apply."
    else
      self.total = (self.total - self.total*(self.discount/100.0)).round
      retStr = "After the discount, the total comes to $#{self.total}."
    end
    retStr
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = self.previous
  end
end
