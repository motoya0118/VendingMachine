require_relative '/Users/motoya/study/vending_machine/drink.rb'

class VendingMachine
  
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sum = 0
    @drinks = [
      Drink.new('cola',120,5),
      Drink.new('redbull',200,5),
      Drink.new('water',100,5),
    ]
  end

  def current_slot_money
    @slot_money
  end

  def current_drinks
    @drinks
  end

  def current_sum
    @sum
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end
 
  def return_money
    puts "おつり：#{@slot_money}"
    @slot_money = 0
  end
  
  def restock(name,price,stock)
    unless price > 0
      puts 'priceは正の整数にして下さい'
      return nil
    end
    unless stock > 0
      puts '在庫は正の整数にして下さい'
      return nil
    end
    
    target_drink = find_target_drink(@drinks,name)
    puts target_drink
    if target_drink
      target_drink.stock += stock
    else
      @drinks << Drink.new(name,price,stock)
    end
    puts @drinks
  end

  def buyable_list
    @drinks.filter do |drink|
      drink.buyable?(@slot_money)
    end
  end
  
  def buy
    puts "購入可能なドリンクリスト"
    buyable_list.each_with_index {|drink,n| puts "#{n}:#{drink.name},値段:#{drink.price}"}
    puts "数字を入力してください"
    user_select = gets.to_i
    if user_select < buyable_list.length
      select_drink = buyable_list[user_select]
      stock_transaction(select_drink)
      money_transaction(select_drink)
      return_money
    else
      puts "選択したドリンクはありません"
    end
  end
  private
  def money_transaction(select_drink)
    @slot_money -=  select_drink.price
    @sum += select_drink.price
    puts "#{select_drink.name}を購入しました"
  end

  def stock_transaction(select_drink)
    select_drink.stock -= 1
  end

  def find_target_drink(drinks,name)
    drinks.each do |drink| 
      if drink.name == name
        return drink
      end
    end
    nil
  end

end





