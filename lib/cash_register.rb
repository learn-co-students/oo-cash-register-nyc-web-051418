require 'pry'
class CashRegister
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @item_list = []
    @last_transaction = nil
  end

 attr_accessor :discount, :total

  def add_item(title, price, quantity = 0)
    if quantity != 0
      @total += (price * quantity)
      @last_transaction = price * quantity
      quantity.times do
        @item_list << title
      end
    else
      @total += price
      @last_transaction = price
      @item_list << title
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total = @total - (@total * (@discount.to_f / 100))
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    return @item_list
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end

register = CashRegister.new(20)
register.total = 1000
register.apply_discount
