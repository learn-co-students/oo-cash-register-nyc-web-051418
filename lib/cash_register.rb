require 'pry'

class CashRegister

  attr_accessor :total, :discount
  attr_reader :items, :last_price

  def initialize(emp_discount = 0)
#    binding.pry
    @discount = emp_discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)

    @total += price * quantity
    @last_price = price * quantity

    quantity.times do
      @items << title
    end

  end

  def items
    return @items
  end

  def apply_discount

    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total - @total * discount.to_f / 100
      return "After the discount, the total comes to $#{@total.round(0)}."
    end

  end

  def void_last_transaction

    @items.pop
    @total -= @last_price

  end

end

ring_ring = CashRegister.new(20)
ring_ring.add_item("celery", 100)
ring_ring.add_item("meat", 100)
ring_ring.add_item("corn", 100, 2)
ring_ring.add_item("cereal", 100)

puts ring_ring.total

puts ring_ring.apply_discount
