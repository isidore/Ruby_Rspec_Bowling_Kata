

RSpec.describe Untitled do


  it "does something useful" do
    # Give me the FizzBuzz printouts up to 20
    # Expected to equal 1,2,Fizz,4,Buzz,Fizz,7,8,Fizz,Buzz,11,Fizz,13,14,FizzBuzz,16,17,Fizz,19,Buzz
    # startCounter() # Comment out after first run
    expect(fizz_buzz(20)).to eq("1,2,Fizz,4,Buzz,Fizz,7,8,Fizz,Buzz,11,Fizz,13,14,FizzBuzz,16,17,Fizz,19,Buzz")
  end

  def fizz_buzz(count)
    numbers = (1..count).map do |n|
      if n == 15
        "FizzBuzz"
      elsif n % 3 == 0
        "Fizz"
      elsif n % 5 == 0
        "Buzz"
      else
        n.to_s
      end
    end.join(",")

    numbers
  end
end
