class CashRegister
   attr_reader :items
   attr_accessor :discount, :total

   def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_item = {}
   end

   def item_input(item, amount = 0)
      amount.times{ @items << item }
   end

   def store_last_item(item_name, item_price, item_amount)
      @last_item[:title] = item_name
      @last_item[:price] = item_price
      @last_item[:quantity] = item_amount
   end

   def add_item(title, price, quantity = 1)
      @total += price * quantity
      item_input(title, quantity)
      store_last_item(title, price, quantity)
   end

   def apply_discount
      if @discount != 0
         @total -= (@total * (@discount.to_f * 0.01)).to_i
         "After the discount, the total comes to $#{@total}."
      else
         "There is no discount to apply."
      end
   end

   def void_last_transaction
      @last_item[:quantity].times{ @items.pop }
      @total -= @last_item[:quantity] *  @last_item[:price]
   end
end