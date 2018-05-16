class CashRegister
  attr_accessor :discount, :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title,price,quantity=1)
    self.total += price*quantity
    quantity.times {@items << title}
  end

  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total = self.total*(1-discount.to_f / 100)
      self.total = self.total.to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total = 0
  end




end
