class Lexiconomitron

  def shazam(argument)
    argument.map do |arg|
      devours(arg.reverse)
    end
  end

  def oompa_loompa(arguement)
    arguement.select do |arg|
      arg.length <= 3
    end.map do |word|
      devours(word)
    end
  end

  private
  def devours(argument)
    argument.gsub("T", "").gsub("t","")
  end
end

lexiconomitron = Lexiconomitron.new


# Test One: Check if answer doesn't include T
answer = lexiconomitron.shazam(["This"])

if !answer.include?("T")
  puts "OK"
else
  puts "FAIL, got #{answer} instead"
end

# Test Two: Check if answer is empty
answer = lexiconomitron.shazam([])

if answer == []
  puts "OK"
else
  puts "FAIL, got #{answer} instead"
end

# Test one (oompa_loopma) check if length is less than or equal to 3
answer = lexiconomitron.oompa_loompa(["This", "BIIII", "one", "two"])

if answer == lexiconomitron.oompa_loompa(["one", "wo"])
  puts "OK"
else
  puts "FAIL, got #{answer} instead"
end

