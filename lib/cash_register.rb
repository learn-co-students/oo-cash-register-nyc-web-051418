require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :price

    def initialize(discount=0)
        @total = 0
        @items = []
        @discount = discount
    end

    def total
        @total
    end

    def add_item (title, price, quantity=1)
        @total += (price * quantity)

    end

    def items (items)
        @items << items
    end

end




    # def total_price
    #
    #   if @employee_discount != 0
    #       # @total * @employee_discount
    #       # puts "After the discount, the total comes to $#{@total}."
    #   else
    #       puts "There is no discount to apply."
    #   end
    #   end
