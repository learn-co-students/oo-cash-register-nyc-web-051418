class CashRegister

  attr_accessor :total, :discount, :title, :price, :items

  def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
  end

  def add_item(title, price, quantity = 1)
    @total_before_adding = self.total
    self.total += (price * quantity)
    quantity.times { items << title }
  end

  def apply_discount
    if @discount != 0
      @total = (@total * ((100 - @discount.to_f)/100)).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = @total_before_adding
  end


end
