class Stock < ApplicationRecord
  
  def self.new_from_lookup(ticker_symbol)
    begin
      looked_up_stocks = StockQuote::Stock.quote(ticker_symbol)
      new(name: looked_up_stocks.company_name, ticker: looked_up_stocks.symbol, last_price: looked_up_stocks.latest_price)
    rescue Exception => e 
      return nil
    end
  end
end
