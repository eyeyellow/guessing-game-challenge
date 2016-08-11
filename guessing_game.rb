class GuessingGame
  attr_accessor :congrats_message, :remaining_guesses

  def initialize(secret_num, num_allowed_guesses)
    @secret_num = secret_num
    @num_allowed_guesses = num_allowed_guesses
    @congrats_message = "Yay, you won!"
    @guesses = []
    @remaining_guesses = num_allowed_guesses
  end

  def has_won?
    if @guesses.include?(@secret_num) && @guesses.length <= @num_allowed_guesses
      return true
    else
      return false
    end
  end

  def has_lost?
    if @remaining_guesses <= 0 && !@guesses.include?(@secret_num)
      return true
    else
      return false
    end
  end

  def guess(num)
    @remaining_guesses -= 1 unless @guesses.include?(num)
    @guesses << num
    if @remaining_guesses < 0 && @guesses.include?(@secret_num) && @guesses.index(@secret_num) <= @num_allowed_guesses
      return "You already won. The number was #{@secret_num}"
    elsif @remaining_guesses <= 0 && @secret_num != num
      return "You lost! The number was #{@secret_num}"
    elsif has_lost?
      return "You already lost. The number was #{@secret_num}"
    elsif @remaining_guesses == 1 && @secret_num < num
      return "Too high! WARNING: Only one guess left!"
    elsif @secret_num > num
      return "Too low!"
    elsif @secret_num < num
      return "Too high!"
    elsif @secret_num == num
      "#{@congrats_message} The number was #{@secret_num}"
    end
  end

end
