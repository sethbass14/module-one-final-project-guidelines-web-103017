
require 'pry'
require_relative '../config/environment.rb'


a = Adapter.new

def seed(array)
  array.each do |show_hash|
    date_year = show_hash["eventDate"]
    year = Year.find_or_create_by(year: date_year.split("-").last.to_i)
    show = Show.find_or_create_by(date: date_year)
    year.shows << show
    venue = Venue.find_or_create_by(name: show_hash["venue"]["name"])
    venue.shows << show
    show_hash["sets"]["set"].each do |set_hash|
      set_hash['song'].each do |song_hash|
        song = Song.find_or_create_by(name: song_hash["name"])
        #This associaton looks good
        ShowSong.create(show_id: show.id, song_id: song.id)

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
