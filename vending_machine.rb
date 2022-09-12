require_relative '/Users/motoya/study/vending_machine/drink.rb'

class VendingMachine
  include Drink
  
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sum = 0
    @drinks = initialize_drink
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
  
  def restock(drink,price,num)
    unless price > 0
      puts 'priceは正の整数にして下さい'
      return nil
    end
    unless num > 0
      puts '在庫は正の整数にして下さい'
      return nil
    end
    obj = {price:price,num:num}
    if @drinks.include?(drink)
      @drinks[drink][:num] = @drinks[drink][:num].to_i + num
    else
      @drinks[drink] = obj
    end
    puts @drinks
  end

  def can_buy_drinks
    can_buy_drinks = []
    @drinks.each do |drink,params|
      if params[:num] > 0 && @slot_money >= params[:price]
        can_buy_drinks << {drink => params[:price] }
      end
    end
    can_buy_drinks
  end
  
  def buy
    drinks_list = can_buy_drinks
    puts "購入可能なドリンクリスト"
    drinks_list.each_with_index {|drink,n| puts "#{n}:#{drink.keys[0]},値段:#{drink.values[0]}"}
    puts "数字を入力してください"
    user_select = gets.to_i
    if user_select < drinks_list.length
      drink_name = drinks_list[user_select].keys[0]
      price = drinks_list[user_select].values[0]
      @slot_money -=  price
      @drinks[drink_name][:num] -= 1
      @sum += price
      puts "#{drink_name}を購入しました"
      return_money
    else
      puts "選択したドリンクはありません"
   end
  end
end





