  def welcome
    puts "Welcome to Deadsetter, your one-stop shop for every Grateful Dead setlist from 1965-1995."
    sleep(1)
    puts
    puts "At anytime you can enter 'q' to quit our psychedelic application. We take a break a 4:20 everday, so don't feel bad to dip out!"
    puts
    sleep(0.5)
    puts "At anytime you can enter 'm' to return home to the menu. Going home, going home, by the menu prompt, we will rest our bones."
    sleep(2)
  end

  def spaced_out
    puts "We're too spaced out to read your date, brah."
    find_shows_by_year
  end

  def invalid_input
    sleep(1)
    puts
    puts "Whoooooa. Bummer. Your input is like way invalid. Please enter a heady input that flows with our vibes. You can always press enter 'q' to quit on Jerr Bear or 'm' to go back to the main menu."
    puts
    sleep(1)
  end

  def main_prompt
    puts
    puts "Here is our menu. We call it 'Terrapin Station.' How would like to search this heady collection? Please enter 1-3:"
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
      else
        invalid_input
        main_prompt
    end
  end

  def gets_input
    input = gets.chomp
    if input.downcase == 'q'
      exit_message
      exit
    elsif input.downcase == 'm'
      main_prompt
    else
      input
    end
  end

  def year_date_menu
    puts
    puts "Select '1' if you know what killer show you'd like to look up. Select '2' if you want to browse by far out year!"
    puts "1. Search by Date"
    puts "2. Browse by year"
  end

  def year_prompt
    puts
    puts "Please enter a year between 1965 and 1995 (YYYY):"
  end

  def date_prompt
    puts
    puts "Please enter a date (month dd, yyyy):"  # (DD-MM-YYYY)
  end

  def date_or_year?
    year_date_menu
    input = gets_input
    if input == "1"
      find_show_by_date
    elsif input == "2"
      find_shows_by_year
    else
      invalid_input
      sleep(2)
      date_or_year?
    end
  end

  def collect_dates
    dates = Show.all.collect{|show| show.date}.sort
    dates.collect{|date| date.strftime("%B %d, %Y")}
  end

  def find_show_by_date
    date_prompt
    date = gets_input
    if collect_dates.include?(date)
      show = Show.where(date: date).first
      venue = show.venue
      set = show.songs.collect {|song| song.name }
      puts "On this day in the history of the Grateful Dead, the Dead played #{venue.name} in #{venue.city.name}."
      sleep(2)
      puts
      puts "Check out this heady setlist:"
      sleep(2)
      set.each {|song| puts song; sleep(0.2)}
      sleep(1)
      puts
      puts "Ahhhh, I can hear the music play!"
      main_prompt
    else
      spaced_out
    end
  end

  def collect_years
    Year.all.collect{|year| year.year}.sort
  end

  def find_shows_by_year
    year_prompt
    input = gets_input.to_i
    if collect_years.include?(input)
      year = Year.where(year: input).first
      shows = year.shows.collect{|show| show.date}.sort
      puts
      shows.each{|show| puts show.strftime("%B %d, %Y"); sleep(0.01)}
      sleep(1)
      puts
      puts "WHOOOOOOOOOAAAAAA!!"
      puts
      sleep(1)
      puts "Music never stopped in #{input}!!"
      find_show_by_date
    else
      spaced_out
    end
  end

  def location_menu
    puts
    puts "What cities did the boys play? Enter 1!"
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
      invalid_input
      city_or_venue?
      # call invalid_input method
    end
  end

  def city_prompt
    puts "Please enter a city:"
  end

  def venue_prompt
    puts "Please enter a venue:"
  end

  def collect_cities
    City.all.collect{|city| city.name}.sort
  end

  def find_shows_by_city
    puts
    city_prompt
    input = gets_input.split(' ').collect {|word| word.capitalize}.join(" ")
    if collect_cities.include?(input)
      city = City.where(name: input).first
      all_shows = city.venues.collect{|venue| venue.shows}.flatten
      puts
      puts "The Dead played in #{input} on these dates:"
      puts
      all_shows.each{|show| puts show.date.strftime("%B %d, %Y"); sleep(0.01)}
      puts
      sleep(1.5)
      puts "Wow #{city.name} LOVES the Dead! They played there #{all_shows.length} time(s)."
      main_prompt
    else
      invalid_input
      puts
      collect_cities.each{|city| puts city; sleep(0.01)}
      puts
      find_shows_by_city
    end
  end

  def collect_venues
    Venue.all.collect{|venue| venue.name}.sort
  end

  def find_shows_by_venue
    puts
    venue_prompt
    input = gets_input.split(' ').collect {|word| word.capitalize}.join(" ")
    if collect_venues.include?(input)
      venue = Venue.where(name: input).first
      all_shows = venue.shows.collect{|show| show.date}
      puts
      puts "The Dead played at the #{input} on these dates:"
      puts
      all_shows.each{|show| puts show.strftime("%B %d, %Y"); sleep(0.01)}
      puts
      puts "The Dead played the #{venue.name} #{all_shows.length} times."
      sleep(1.5)
      puts
      main_prompt
    else
      invalid_input
      puts
      collect_venues.each{|venue| puts venue; sleep(0.025)}
      puts
      find_shows_by_venue
    end
  end

  def song_prompt
    puts "Please enter a Dead song. Which one? Any one! They are all groovy!"
  end

  def all_song_names
    Song.all.collect {|song| song.name}
  end

  def make_title(title)
    lowercase = %w{a an the for and nor but ot yet so at around by after along for from of on to with without}
    string = title.split(' ').collect {|word| lowercase.include?(word.downcase) ? word.downcase : word.capitalize}.join(" ")
    string[0].upcase
    string
  end

  def find_shows_by_song
    puts
    song_prompt
    user_input = gets_input
    input = make_title(user_input)
    if all_song_names.include?(input)
      song = Song.where(name: input).first
      all_shows = song.shows.collect{|show| show.date}.sort
      first = all_shows.first
      last = all_shows.last
      puts
      sleep(1)
      puts
      puts "The Dead played #{input} on these dates:"
      all_shows.each{|show| puts show.strftime("%B %d, %Y"); sleep(0.01)}
      puts
      puts "First time played: #{first.strftime("%B %d, %Y")}"
      puts "Last time played: #{last.strftime("%B %d, %Y")}"
      puts "#{input} was played #{all_shows.length} times in total."
      sleep(1.5)
      puts
      puts "Wow, the Dead went IN on that tune!"
      main_prompt
    else
      invalid_input
      puts "Here is the master list of songs to choose from!"
      puts
      sleep(1)
      puts "Wait for it...."
      puts
      sleep(1)
      puts "Wait for it...."
      puts
      sleep(2)
      puts "BOOM!"
      puts
      all_song_names.sort.each {|song| puts song; sleep(0.05)}
      puts
      sleep(1)
      find_shows_by_song
    end
  end

  def exit_message
    puts
    sleep(0.5)
    puts "Crunchy Dead Heads of the world salute you! Thanks for using Deadsetter! See you next time!"
  end

  def deadsetter
    welcome
    main_prompt
  end
