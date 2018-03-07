namespace :scrape do
  desc "TODO"
  task items: :environment do
    range = (6.downto(0)).to_a.collect { |i| i.days.ago.to_i }

    urls = range.collect do |i|
      "https://min-api.cryptocompare.com/data/histominute?fsym=IOST&tsym=USDT&limit=2000&aggregate=1&e=HuobiPro&toTs=#{i}"
    end

    urls.each do |url|
      rs = RestClient.get url
      response = JSON.parse rs.body
      items = response['Data']
      puts items.size.inspect
      puts '*' * 100
      puts

      items.each do |item|
        i = Item.find_or_initialize_by time: item['time']
        i.attributes = {
          close: item['close'],
          high: item['high'],
          low: item['low'],
          open: item['open'],
          volumefrom: item['volumefrom'],
          volumeto: item['volumeto']
        }
        i.save
      end
    end
  end

  desc 'csv'
  task csv: :environment do
    File.open("public/items.csv", "w") { |file| file.write(Item.order('time asc').to_csv) }
  end
end
