class CashRegister
  attr_accessor :total
  attr_reader :discount, :items, :transactions

  def initialize( discount = 0 )
    @total = 0.00
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item( item, price, quantity = 1 )
    self.total += price * quantity

    quantity.times do 
      self.items << item
    end

    self.transactions << {
      item: item,
      price: price,
      quantity: quantity
    }

  end

  def apply_discount
    return "There is no discount to apply." if discount == 0
    self.total -= ((discount.to_f / 100.00) * total)
    "After the discount, the total comes to $#{total.to_i}."
  end

  def void_last_transaction
    self.total -= transactions.last[ :price ] * transactions.last[ :quantity ]
    self.transactions.pop
  end

end