require 'pry'

class Adapter

  attr_reader :all_data

  def initialize
    @all_data = []

    year = 77
    year_limit = 81

    until year == year_limit
      page = 1
      page_limit = 0
        until page == page_limit
          request = RestClient.get("https://api.setlist.fm/rest/1.0/search/setlists?artistName=Grateful%20Dead&p=#{page}&year=19#{year}",
          headers={'Accept' => 'application/json', 'x-api-key' => '591e876d-688c-4e22-98b8-d49acf482eb9'})
          data = JSON.parse(request)
          page_limit = (data["total"].to_f/data["itemsPerPage"].to_f).ceil + 1
          setlists = data["setlist"]
          @all_data << setlists
          page += 1
        end
      page = 1
      year += 1
    end
    @all_data.flatten!
  end

  def collect_years
    self.all_data.collect do |show_hash|
      event_date = show_hash["eventDate"]
      event_date.split("-")[-1]
    end.uniq
  end

  def collect_shows
    self.all_data.collect do |show_hash|
      show_hash["eventDate"]
    end.uniq
  end

  # def collect_songs
  #   self.all_data.collect do |show_hash|
  #     song = show_hash["eventDate"]
  #     event_date.split("-")[-1]
  #   end.uniq
  # end

end
