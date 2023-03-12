VALID_CHOICES = { "r" => %w(rock scissors lizard),
                  "p" => %w(paper rock spock),
                  "s" => %w(scissors paper lizard),
                  "l" => %w(lizard paper spock),
                  "v" => %w(spock scissors rock) }

WIN_COUNT = { "You won." => 0, "Computer won." => 0 }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  VALID_CHOICES[first][1..2].include?(VALID_CHOICES[second][0]) ? true : false
end

def display_results(player, computer)
  if win?(player, computer)
    "You won."
  elsif win?(computer, player)
    "Computer won."
  else
    "Tie."
  end
end

def grand_winner
  if WIN_COUNT.values.include?(3)
    prompt "#{WIN_COUNT.key(3).chop.upcase} 3 times; Grand Winner decided."
    prompt "Game over."
    1
  end
end

loop do
  while true
    prompt "Choose one; rock(r), paper(p), scissors(s), lizard(l), spock(v)."
    player_choice = gets.chomp.downcase
    if VALID_CHOICES.keys.include?(player_choice)
      break
    else
      prompt "Invalid choice, pick again please. r, p, s, l, or v?"
    end
  end

  computer_choice = VALID_CHOICES.keys.sample

  prompt "You chose #{VALID_CHOICES[player_choice][0]};"
  prompt "Computer chose #{VALID_CHOICES[computer_choice][0]}"

  winner = display_results(player_choice, computer_choice)
  prompt winner

  if WIN_COUNT.keys.include?(winner)
    WIN_COUNT[winner] += 1
  end

  break if grand_winner() == 1

  prompt "Would you like to play again? (y/n)."
  answer = gets.chomp
  break unless answer.downcase == "y"
end
