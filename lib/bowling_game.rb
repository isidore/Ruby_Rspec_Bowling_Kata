require_relative 'frame.rb'

class BowlingGame
  attr_accessor :frames

  def initialize
    @frames = []
  end

  def roll(*rolls)
    starting_score = 0
    roll_index = 0
    for frame_number in 1..10 do

      frame = Frame.new
      frame.frame_number = frame_number
      frame.startingScore = starting_score
      frame.rolls << rolls[roll_index]
      roll_index += 1

      if frame.strike?
        frame.rolls << rolls[roll_index]
        frame.rolls << rolls[roll_index+1]

      else
        frame.rolls << rolls[roll_index]
        roll_index += 1
        if (frame.spare?)
          frame.rolls << rolls[roll_index]
        end
      end
      frames << frame
      starting_score = frame.get_total_score
    end

  end

  def score()
    return frames.map { |f| f.score }.join "\n"
  end

end