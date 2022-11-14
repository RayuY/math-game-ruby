class Start
  
  attr_reader :round , :current_player

  def initialize
    @players = []
    @round = 0
    @current_player = nil
  end

  def game_start

    puts "Welcome to the math deathmatch! Who will walk out alive?"
    
    print "Name of first brave contestant: "
    player_one = Player.new($stdin.gets.chomp)
    @players.push(player_one)

    print "Name of Second brave contestant: "
    player_two = Player.new($stdin.gets.chomp)
    @players.push(player_two)

    puts "Who goes first you ask? It's random.. now here we go, first question!"

    @current_player = players[rand(0..1)]

    while (current_player.lives != 0)
      start_round
    end
    end_game

  end

  def increment_round
    @round++
  end

  def rotate_players
    @current_player = @players[0]? @players[1] : @players[0]
  end

  def end_game
    puts "--- GAME FINISHED ---"
    puts "#{@current_player.name}, you have ran out of lives, you are DEAD."

    rotate_players
    puts "-- CONGRATS #{@current_player.name} --, you WON!!"
    puts "Your final score is #{current_player.lives}/3, total rounds prevailed: #{@round}"
    puts "--- GOOD BYE AND HOPE TO SEE YOU AGAIN! ---"
  end


  def start_round

    increment_round
    rotate_players

    question = Question.new()
    
    puts "--- Round #{@round} ---"
    print "#{@current_player.name}, #{question.ask_question}"
    player_answer = $stdin.gets.chomp

    if question.right_answer(player_answer)
      puts "You got it right!"
    else
      puts "Oh no, you lost 1 live cause you didn't get the right answer"
    end

  end

end
