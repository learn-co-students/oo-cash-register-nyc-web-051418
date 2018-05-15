class CashRegister
  attr_accessor :total, :items, :last_price
  attr_reader :discount
  def initialize(discount=0)
    @total = 0
    @items = []
    @discount = discount
    @last_price = 0
  end

  def add_item(title, price, quantity=1)
    self.total += (price * quantity)
    self.last_price = price
    quantity.times {items << title}
  end

  def apply_discount
    if discount > 0
      self.total = total - (total * (discount / 100.00))
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    items.pop
    self.total -= last_price
  end
end
