require 'pry'
# This code will give us an array of arrays. Each array is full of 20 hashes. Each hash contains the set list data from
# one show.
master = []
i = 1
  until i == 118
    request = RestClient.get("https://api.setlist.fm/rest/1.0/search/setlists?artistName=Grateful%20Dead&p=#{i}",
      headers={'Accept' => 'application/json', 'x-api-key' => '591e876d-688c-4e22-98b8-d49acf482eb9'})
      data = JSON.parse(request)
      setlists = data["setlist"]
      master << setlists
      i += 1
  end

binding.pry
puts "hello"
