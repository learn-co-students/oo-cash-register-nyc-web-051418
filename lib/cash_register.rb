class CashRegister
  attr_accessor :total, :last_price
  attr_reader :discount, :items

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
    @last_price = 0
  end

  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times {@items << title}
    @last_price = price
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      @total -= @discount.to_f / 100 * @total
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total = @total - @last_price
  end

end
