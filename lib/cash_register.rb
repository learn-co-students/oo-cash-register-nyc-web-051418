require 'pry'

class CashRegister

    attr_accessor :total, :items, :discount, :last

    def initialize(discount = nil)
      @total = 0
      @items = []
      @discount = discount
    end

    def add_item(item, price, quantity = 1)

      ctr = 1
      while ctr <= quantity do
        @items << item
        ctr+=1
      end
      @last = price*quantity
      self.total += price*quantity
    end

    def apply_discount
      if @discount
        @total = @total - (@total*@discount)/100
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end

    def void_last_transaction
      self.total -= @last
    end
end
