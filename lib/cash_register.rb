class CashRegister
  attr_accessor :total #dumb, the only time this is set outside the instance methods is for the testing
  attr_reader :items, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
    @last_transaction_qty
  end
  
  def add_item(item, price, qty = 1)
    @total += price * qty
    qty.times do @items << item end
    qty.times do @prices << price end
    @last_transaction_qty = qty
  end

  def apply_discount
    if discount != 0
      @total = total - (total * discount / 100)
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @last_transaction_qty.times do @items.pop() end
    @last_transaction_qty.times do @prices.pop() end
    @total = @prices.length == 0 ? 0 : @prices.sum
  end
end

