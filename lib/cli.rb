  def welcome
    puts "Welcome to Deadsetter, your one-stop shop for every Grateful Dead setlist from 1977-80."
  end

  def main_prompt
    puts
    puts "How would like to search this heady collection? Please enter 1-3:"
    puts "1. Date"
    puts "2. Location"
    puts "3. Song"
    input = gets_input
    case input
    when "1"
      date_or_year?
    when "2"
      city_or_venue?
    when "3"
      find_shows_by_song
    end
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
    puts "Please enter a year (YYYY):"
  end

  def date_prompt
    puts "Please enter a date (DD-MM-YYYY):"
  end

  def date_or_year?
    year_date_menu
    input = gets_input
    if input == "1"
      find_show_by_date
    elsif input == "2"
      find_shows_by_year
    else
      puts "WE FUCKED UP!!"
      # call invalid_input method
    end
  end

  def find_show_by_date
    date_prompt
    date = gets_input
    show = Show.where(date: date).first
    venue = show.venue
    set = show.songs.collect {|song| song.name }
    puts "On this day in the history of the Grateful Dead, the Dead played #{venue.name} in #{venue.city.name}."
    sleep(2)
    puts
    puts "Check out this heady setlist:"
    sleep(2)
    set.each {|song| puts song; sleep(0.5)}
    sleep(1)
    puts
    puts "Ahhhh, I can hear the music play!"
  end

  def find_shows_by_year
    year_prompt
    input = gets_input
    year = Year.where(year: input).first
    shows = year.shows.collect{|show| show.date}
    puts
    shows.each{|show| puts show}
    sleep(1)
    puts
    puts "WHOOOOOOOOOAAAAAA!!"
    puts
    sleep(1)
    puts "Music never stopped in #{input}!!"
    find_show_by_date
  end

  def location_menu
    puts "What cities did the boys play 1977-80? Enter 1!"
    sleep(0.25)
    puts "Have a favorite venue? Enter 2 to search by venue!!"
    puts
    puts "1. City"
    puts "2. Venue"
  end

  def city_or_venue?
    location_menu
    input = gets_input
    if input == "1"
      find_shows_by_city
    elsif input == "2"
      find_shows_by_venue
    else
      puts "WE FUCKED UP!!"
      # call invalid_input method
    end
  end

  def city_prompt
    puts "Please enter a city:"
  end

  def venue_prompt
    puts "Please enter a venue:"
  end

  def find_shows_by_city
    city_prompt
    input = gets_input
    city = City.where(name: input).first
    all_shows = city.venues.collect{|venue| venue.shows}.flatten
    puts
    puts "The Dead played in #{input} on these dates:"
    puts
    all_shows.each{|show| puts show.date; sleep(0.15)}
  end

  def find_shows_by_venue
    venue_prompt
    input = gets_input
    venue = Venue.where(name: input).first
    all_shows = venue.shows.collect{|show| show.date}
    puts
    puts "The Dead played at the #{input} on these dates:"
    puts
    all_shows.each{|show| puts show; sleep(0.15)}
  end

  def song_prompt
    puts "Please enter a Dead song:"
  end

  def find_shows_by_song
    song_prompt
    input = gets_input
    song = Song.where(name: input).first
    all_shows = song.shows.collect{|show| show.date}
    puts
    puts "#{input} was played #{all_shows.length} times in this period."
    puts
    puts "The Dead played #{input} on these dates:"
    puts
    all_shows.each{|show| puts show; sleep(0.05)}
  end

  def deadsetter
    welcome
    main_prompt
  end
