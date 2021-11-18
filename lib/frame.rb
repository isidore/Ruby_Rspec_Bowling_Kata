class Frame
  attr_accessor :frame_number, :rolls, :startingScore
  def initialize()
    @frame_number = 1
    @rolls = []
    @startingScore = 0
  end

  def score
    return "#{frame_number}) #{ get_frame_rolls_text} [#{get_frame_score}] => #{get_total_score}"
  end


  def get_total_score
    get_frame_score + @startingScore
  end

  def get_frame_score
    rolls.sum
  end

  def strike?
    rolls[0] == 10
  end

  def get_frame_rolls_text
    last = 1
    if strike?
      last = 0
    end
    if frame_number ==10
      last = rolls.size - 1
    end
      return rolls[0..last].join(",")

  end

  def spare?
    rolls[0..1].sum == 10
  end
end
