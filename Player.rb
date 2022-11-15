class Player
  attr_reader :name
  attr_reader :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lose()
    @lives -= 1
  end
end
