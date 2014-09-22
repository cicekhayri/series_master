class Lexiconomitron

  def shazam(argument)
    argument.map do |arg|
      devours(arg.reverse)
    end   
  end

  def oompa_loompa(argument)
    argument.select do |arg|
      arg.length <= 3
    end.map do |word|
      devours(word)
    end
  end

  private
  def devours(argument)
    argument.gsub(/[Tt]/, "")
  end

end

lexiconomitron = Lexiconomitron.new
lexiconomitron.shazam(["This"])
lexiconomitron.oompa_loompa(["Hello","Hej"])

describe Lexiconomitron do
  describe "#shazam" do 
    before do
      @lexiconomitron = Lexiconomitron.new
    end

    it "should reverse one element of the array" do
      expect(@lexiconomitron.shazam(["This"])).to eq(["sih"])
    end

    it "should reverse multiple element of the array" do
      expect(@lexiconomitron.shazam(["This", "one"])).to eql(["sih", "eno"])
    end

    it "should reverse and drop the letter T" do
      expect(@lexiconomitron.shazam(["This"])).to eql(["sih"])
    end
  end

  describe "#oompa_loompa" do
    before do
      @lexiconomitron = Lexiconomitron.new
    end
    it "should print out the elements with 3 or less character" do 
      expect(@lexiconomitron.oompa_loompa(["This","one"])).to eql(["one"])
    end
  end

end