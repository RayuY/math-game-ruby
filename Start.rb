class Start
  attr_reader :round, :current_player

  def initialize
    @players = []
    @round = 0
    @current_player = nil
  end

  # takes in user names and start game
  def game_start
    puts "Welcome to the math deathmatch! Who will walk out alive?"

    print "Name of first brave contestant: "
    player_one = Player.new($stdin.gets.chomp)
    @players.push(player_one)

    print "Name of Second brave contestant: "
    player_two = Player.new($stdin.gets.chomp)
    @players.push(player_two)

    puts
    puts "Who goes first you ask? It's random.. each player has 3 lives.. now here we go, first question!
    "

    @current_player = @players[rand(0..1)]

    # runs rounds till one player has depleted all lives.
    while (current_player.lives != 0)
      start_round
    end
    end_game
  end

  # tracks how many rounds since game start
  def increment_round
    @round += 1
  end

  # changes current player when called
  def rotate_players
    if @current_player == @players[0]
      @current_player = @players[1]
    else
      @current_player = @players[0]
    end
  end

  # prints out results of the game
  def end_game
    puts "---- GAME FINISHED ----
    "
    # current_player will be the loser from last start_round
    puts "#{@current_player.name}, you have ran out of lives, you are DEAD.
    "

    # switches to winner
    rotate_players

    puts "---- CONGRATS #{@current_player.name} ----, you WON!!
    "
    puts "Your final score is #{current_player.lives}/3, total rounds prevailed: #{@round / 2}
    "
    puts "---- GOOD BYE AND HOPE TO SEE YOU AGAIN! ----"
  end

  # runs round with question randomizer
  def start_round
    increment_round
    rotate_players

    question = Question.new()

    puts "---- Round #{@round} ----"
    print "#{@current_player.name}, #{question.ask_question}"
    player_answer = $stdin.gets.chomp.to_i

    if question.correct?(player_answer)
      puts "#{@current_player.name} got it right!
      "
    else
      puts "Oh no, #{@current_player.name} lost 1 life cause he/she didn't get the right answer
      "
      # subtract current player lives by 1
      @current_player.lose
    end
  end
end
