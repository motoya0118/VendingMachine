class Money
  attr_reader :value
  MONEY = [10, 50, 100, 500, 1000].freeze
  
  def initialize
    @value = 0
  end

  def input(value)
    if MONEY.include?(value)
      @value += value
    else
      puts '通貨が違います'
    end
  end

end