class HereApi::Geolocation < HereApi::Base

  class << self
    
    def search_options(searchtext)
      query = { gen: 9, searchtext: searchtext, city: 'Berlin' }.merge( auth_params )
      connection = Excon.new(base_url)
      possible_places( connection.get(query: query).body )
    end

    private
    def base_url
      'http://geocoder.cit.api.here.com/6.2/geocode.json'
    end

    def results(response)
      response["Response"]["View"][0]["Result"]
    end

    def possible_places(response)
      results( JSON.parse( response ) ).map do |rs| 
        OpenStruct.new( { 
          label: rs["Location"]["Address"]["Label"], 
          location: OpenStruct.new( rs["Location"]["DisplayPosition"] )
        } )
      end
    end
  end

end