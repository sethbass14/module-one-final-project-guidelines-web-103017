
require 'pry'


a = Adapter.new

def seed(array)
  array.each do |show_hash|
    date_year = show_hash["eventDate"]
    #Need to add find_or_create_by below
    year = date_year.split("-").last

    #add find or creat by below
    show = date_year
    #add finde or create by below
    venue = show_hash["venue"]["name"]
    show_hash["sets"]["set"].each do |set_hash|
      #This is an array below
      set_hash['song'].each do |song_hash|
        #add find or create by below
        song = song_hash["name"]
        binding.pry
      end
    end

  end

  # json_hash.each do #iterate through entire json_hash
  #
  #   show = Show.create(date: hash[date])
  #   year = Year.find_or_create_by()
  #   venue = Venue.find_or_create_by()
  #   songs = hash[songs]
  #   songs.each do  #iterate though show_songs
  #     song1 = Song.find_or_create_by(.....)
  #     show.songs << song1
  #   end
  #     show.venue = venue
  #     show.year = year
  #
  #
end
seed(a.all_data)
binding.pry
# def collect_years
#   self.all_data.collect do |show_hash|
#     event_date = show_hash["eventDate"]
#     event_date.split("-")[-1]
#   end.uniq
# end
#
# def collect_shows
#   self.all_data.collect do |show_hash|
#     show_hash["eventDate"]
#   end.uniq
# end
#
# def collect_songs
#   self.all_data.collect do |show_hash|
#     show_hash["sets"]["set"]
#     binding.pry
#
# #     event_date.split("-")[-1]
# #   end.uniq
#   end
#  end
#  binding.pry
# end
