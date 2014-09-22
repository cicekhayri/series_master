require 'imdb'
class SeriesMaster
  def get_rating?(argument)
    Imdb::Search.new(argument).movies.first.rating
  end

  def best_serie(argument)

    argument.map do |element|
      [element, get_rating?(element)]
    end.sort do |rating1, rating2|
      rating1 <=> rating2
    end.first.first

  end

end

series_master = SeriesMaster.new
series_master.best_serie(["The Wire", "The Office", "Breaking Bad"])

describe SeriesMaster do 
  describe "#best_serie" do
    before do 
      @series_master = SeriesMaster.new
    end

    it "should sort the array by the rating best first bad last" do
      expect(@series_master.best_serie(["The Wire","The Office", "Breaking Bad"])).to eql("Breaking Bad")
    end

  end  
end