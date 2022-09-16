module Wallet
  def input(inmoney,outmoney,value)
    if inmoney.name == outmoney.name
      inmoney.value += value
      outmoney.value -= value
    end
  end
end