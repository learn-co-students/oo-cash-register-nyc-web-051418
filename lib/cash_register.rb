
class CashRegister

attr_accessor :discount,:total,:items,:last_transaction

def initialize(discount=0)
  @discount=discount
  @total=0
  @items=[]
end

def add_item(item,price,quantity=1)
  @total+= price*quantity
  quantity.times do @items=@items<<item end
  @last_transaction=price*quantity
end

def apply_discount
  @total-=discount*10
  if @total!=0
    "After the discount, the total comes to $#{@total}."
  else
    "There is no discount to apply."
  end
end

def void_last_transaction
  @total-=@last_transaction
end


end
