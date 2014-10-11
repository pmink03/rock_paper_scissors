#rock, paper scissors
require 'pry'

# determines who won the game
# inputs: integers representing game choices for p (player), c(computer)
# output: a string representing the outcome based upon the rules of RPS
def who_won(p, c)
  # array of RPS actions
  win_rps = ['Rock crushes Scissors!', 'Paper wraps Rock!', 'Scissors cuts paper!']
  if(p == c) # player and computer picked same thing so it's a tie
    puts "It's a tie."
  elsif((p==0 && c==2) || (p==1 && c==0) || (p==2 && c==1)) #player win conditions
    puts win_rps[p]
    puts "You won!"
  else #if not a tie and player didn't win then computer must win
    puts win_rps[c]
    puts "Computer won!"
  end
end

# gets input from player to determine if they want to continue playing
# outputs: true to keep playing or false to quit
def play_again?()
    keep_playing = false
    keep_looping = true
    
    # gonna loop until you give me a valid answer
    begin
      puts "Play again? (Y/N)"
      play_again = gets.chomp
      if(play_again =~ /^[Nn]$/)
        keep_playing =false
        keep_looping = false
      elsif(play_again =~ /^[Yy]$/)
        keep_playing = true
        keep_looping = false
      end
    end while keep_looping == true
    
    return keep_playing
end

# gets the player's game move and convert it to an integer
# output: an integer representing the game move
def get_user_selection()
  # maps the user character input to a an integer
  play_num = {'r' => 0, 'p' => 1, 's' => 2 }
    
  # flag to make sure user selection is valid
  valid_user_selection = false
  begin
    # Prompt user for selection
    puts "Choose one: (P/R/S)"
    
    # get selection from user
    user_selection = gets.chomp
    if(user_selection =~ /^[PpRrSs]$/)
      user_selection = user_selection.downcase
      valid_user_selection = true
    else
      puts "Invalid Selection: #{user_selection}. Please try again."
    end
  end while valid_user_selection == false
  
  return play_num[user_selection]  
end

# main play method
# outputs: fun!
def play()
  # Array of possible choices in RPS
  rps = ['Rock', 'Paper', 'Scissors']
  
  # Welcome message
  puts "Play Paper Rock Scissors!"

  # play until keep_playing is false
  keep_playing = true
  
  # main game loop
  begin     
    user_selection = get_user_selection()

    # get the computer's random pick
    computer_selection = rand(0..2)
    
    puts "You picked #{rps[user_selection]} and computer picked #{rps[computer_selection]}."
    
    # determine outcome
    who_won(user_selection, computer_selection)

    # determine if we should keep playing
    keep_playing = play_again?

  end while keep_playing == true
end

# let's play the game!
play