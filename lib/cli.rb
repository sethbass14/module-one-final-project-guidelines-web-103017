class Deadsetter

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
      find_show_by_date(input)
    elsif input.length == 4
      # call find_shows_by_year method
    else
      # call invalid_input method
    end
  end

  def find_show_by_date(date)
    Show.where(date: date)
  end

end
