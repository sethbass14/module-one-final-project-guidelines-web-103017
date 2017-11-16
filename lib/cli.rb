

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

  def year_date_menu
    puts "Select '1' if you know what killer show you'd like to look up. Select '2' if you want to browse by far out year!"
    puts "1. Search by Date"
    puts "2. Browse by year"
  end

  def year_prompt
    puts "Please enter a year (YYYY)"
  end

  def date_prompt
    puts "Please enter a date (DD-MM-YYYY)"
  end

  def date_or_year?
    input = gets_input
    if input == 1
      find_show_by_date
    elsif input == 2
      find_shows_by_year
      # show = find_show_by_date(input)
      # venue = show.venue
      # set = show.songs.collect {|song| song.name }
      # puts "On this day in the history of the Grateful Dead, the Dead played #{venue.name} in #{venue.city.name}."
      # sleep(2)
      # puts
      # puts "Check out this heady setlist:"
      # sleep(2)
      # set.each {|song| puts song; sleep(0.5)}
      # sleep(1)
      # puts "Ahhhh, I can hear the music play!"
    elsif input.length == 4
      # call find_shows_by_year method
      find_shows_by_year(input)
    else
      # call invalid_input method
    end
  end

  def find_show_by_date
    year_prompt
    date = gets_input
    show = Show.where(date: date)
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
  end


  def find_shows_by_year(year)
    year = Year.where(year: year).first
    year.shows.collect{|show| show.date}
  end
