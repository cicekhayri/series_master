class SeriesMaster

  def best_serie(argument)
    ["The Wire","The Office"]
  end

end

series_master = SeriesMaster.new
series_master.best_serie(["The Wire", "The Office"])

describe SeriesMaster do 
  describe "#best_serie" do
    before do 
      @series_master = SeriesMaster.new
    end

    it "should get multiple elemenents of array" do
      expect(@series_master.best_serie(["The Wire","The Office"])).to eql(["The Wire","The Office"])
    end

  end  
end