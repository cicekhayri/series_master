require 'imdb'

class SeriesMasterOfTheUniverse

  def rating?(name)
    Imdb::Search.new(name).movies.first.rating
  end

  def return_best_serie(argument)
    argument.map do |name|
       [name, rating?(name)]
    end.sort do |(_, rating2), (_, rating1)|
      rating2 <=> rating1
    end.first.first
    p argument
  end
end

get_best_serie = SeriesMasterOfTheUniverse.new
get_best_serie.return_best_serie(["The Wire", "The Office"])

