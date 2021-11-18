require_relative '../lib/bowling_game'

RSpec.describe BowlingGame do
  it "scores normal bowling game" do
    expected_score = "" "
1) 8,0 [8] => 8
2) 7,0 [7] => 15
3) 5,3 [8] => 23
4) 9,1 [19] => 42
5) 9,1 [20] => 62
6) 10 [18] => 80
7) 8,0 [8] => 88
8) 5,1 [6] => 94
9) 3,7 [19] => 113
10) 9,0 [9] => 122
" "".strip


    assert_bowling_game(expected_score,8, 0, 7, 0, 5, 3, 9, 1, 9, 1, 10, 8, 0, 5, 1, 3, 7, 9, 0)

    #1. spec
    # 2. feedback
    # 3. Regression
    # 4. Granularity
    #
  end
  it "scores bowling game with 3 rolls at the end" do
    expected_score = "" "
1) 8,2 [19] => 19
2) 9,0 [9] => 28
3) 4,4 [8] => 36
4) 7,2 [9] => 45
5) 9,0 [9] => 54
6) 10 [28] => 82
7) 10 [18] => 100
8) 8,0 [8] => 108
9) 3,5 [8] => 116
10) 9,1,7 [17] => 133
" "".strip

    assert_bowling_game(expected_score,8,2,9,0,4,4,7,2,9,0,10,10,8,0,3,5,9,1,7)
  end
  def assert_bowling_game(expected_score, *rolls)
    game = BowlingGame.new
    game.roll(*rolls)

    expect(game.score).to eq(expected_score)
  end
end
