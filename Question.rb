class Question
  attr_reader :right_answer

  def initialize()
    @num_one = rand(1..20).to_i
    @num_two = rand(1..20).to_i
    @right_answer = @num_one + @num_two
  end

  def ask_question
    "What is #{@num_one} + #{@num_two}?\nYour Answer > "
  end

  def correct?(answer)
    answer == @right_answer
  end
end
