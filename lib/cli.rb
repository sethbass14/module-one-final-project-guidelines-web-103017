# class Deadsetter

  def welcome
    puts "Welcome to Deadsetter, your one-stop shop for every Grateful Dead setlist from 1977-80."
  end

  def main_prompt
    puts "How would like to search this heady collection? Please enter 1-3:"
    puts "1. Date"
    puts "2. Location"
    puts "3. Song"
  end

  def gets_input
    input = gets.chomp
  end

  def date_prompt
    puts "Please enter a date (DD-MM-YYYY) or year (YYYY)"
  end

  def date_or_year?
    input = gets_input.to_s
    if input.length == 10
      # call find_show_by_date method
      show = find_show_by_date(input)
      venue = show.venue
      set = show.songs.collect {|song| song.name }
      puts "On this day in the history of the Grateful Dead, the Dead played #{venue.name} in #{venue.city.name}."
      sleep(2)
      puts
      puts "Check out this heady setlist:"
      sleep(2)
      set.each {|song| puts song; sleep(0.5)}
      sleep(1)
      puts "Ahhhh, I can hear the music play!"
    elsif input.length == 4
      # call find_shows_by_year method
    else
      # call invalid_input method
    end
  end

  def find_show_by_date(date)
    Show.where(date: date).first
  end

# end
