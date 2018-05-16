require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :price, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @items = []
        @discount = discount
    end

    def total
        @total
    end

    def add_item (title, price, quantity = 1 )
        self.total += (price * quantity)
        @last_transaction = self.total
        quantity.times do
          @items << title
        end

    end


    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            percentage_off = ((100.0 - @discount.to_f)/100)
            self.total = @total * percentage_off
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction

      #binding.pry
      self.total = self.total - self.last_transaction



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


    # def items (items)
    #     @items << items
    # end
