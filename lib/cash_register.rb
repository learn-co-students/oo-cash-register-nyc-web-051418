require 'pry'

class CashRegister

  attr_accessor :discount, :total, :list, :last_transaction

  def initialize(discount = nil)

    @total = 0
    @discount = discount
    @list = []


  end

  def add_item(title, price, quantity = 1)

    @total += price * quantity

    self.last_transaction = price * quantity

    control = 0
    while control < quantity
    @list << title
    control += 1
    end



  end

  def apply_discount

    @total = @total - @total * (@discount.to_f / 100.to_f)
    discount ? "After the discount, the total comes to $#{@total.to_i}." : "There is no discount to apply."

  end

  def items
    @list
  end

  def void_last_transaction
    @total = self.total -= self.last_transaction
  end

end
