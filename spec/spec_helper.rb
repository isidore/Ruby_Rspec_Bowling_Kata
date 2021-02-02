require "bundler/setup"
require "untitled"
$track_failed_passed = false
$failed_file = "fakeit.counter.fail.txt"
$passed_file = "fakeit.counter.pass.txt"
$java = "\"C:\\Program Files\\OpenJDK\\jdk-15.0.1\\bin\\java.exe\""
def startCounter()
  File.write($passed_file, "0")
  File.write($failed_file, "0")
  cmd = "#{$java} -jar utils/CounterDisplay.jar #{$passed_file} #{$failed_file}"
  puts cmd

  Kernel.exec(cmd)
end
def increase_count(file_name)
  if File.file?(file_name)
    count = File.read(file_name).strip.to_i
  else
    count = 0;
  end
  puts("Count  '#{count}'")
  File.write(file_name, (count + 1).to_s)
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  if ($track_failed_passed)
    config.after(:each) do |example|
      if example.exception
        increase_count($failed_file)
      else
        increase_count($passed_file)
      end
    end
  end
end