class Money
  attr_accessor :name, :value
  MONEYTYPE = ['suica','paypay','現金'].freeze
  def initialize(name)
    if MONEYTYPE.include?(name)
      @name = name
      @value = 0
    else
      raise
    end
  end
end