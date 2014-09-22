require 'imdb'
class SeriesMaster
  def get_rating?(argument)
    Imdb::Search.new(argument).movies.first.rating
  end

  def get_search_result(argument)
    Imdb::Search.new(argument).movies.size
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
series_master.get_search_result("Breaking Bad")

describe SeriesMaster do 
  before do 
    @series_master = SeriesMaster.new
  end

  describe "#best_serie" do

    it "should sort the array by the rating best first bad last" do
      expect(@series_master.best_serie(["The Wire","The Office", "Breaking Bad"])).to eql("Breaking Bad")
    end
  end  

  describe "#search_for_number_of_results" do
    it "should get all the result of the search" do
      expect(@series_master.get_search_result("Cat")).to eql(202)
    end
  end   
end