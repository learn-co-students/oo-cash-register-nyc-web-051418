class CashRegister
  attr_accessor :items, :discount, :total, :last_transaction

# initialize a total and items: |array| with an optional discount argument
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

# adds an item (with an optional quantity argument) to the total 
  def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      items << item
    end
    self.last_transaction = price * quantity
  end

# applies optional discount
  def apply_discount
    if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

# voids the last transaction
  def void_last_transaction
    self.total = self.total - self.last_transaction
  end

end
