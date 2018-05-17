require 'pry'

class CashRegister

attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = [price, quantity]
    @total += price * quantity
    quantity.times {@items << title}
  end

  def apply_discount
    #binding.pry
    amount_discounted = @total * @discount / 100
    @total -= amount_discounted
    @discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{total}."
  end

  def items
    @items
  end

  def void_last_transaction
    remove_last_transaction_from_total
    remove_items_from_list
  end

  def remove_last_transaction_from_total
    amount_to_substract = @last_transaction[0]*@last_transaction[1]
    @total -= amount_to_substract
  end

  def remove_items_from_list
    @last_transaction[1].times {@items.pop}
  end


end
