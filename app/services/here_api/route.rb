class HereApi::Route < HereApi::Base
  WAYPOINT0 = "geo!52.51916,13.34542"
  WAYPOINT1 = "geo!52.50948,13.59148"

  class << self

    def search_options(from_geo = WAYPOINT0, to_geo = WAYPOINT1)
      query = default_attribs.merge( auth_params ).merge({waypoint0: from_geo, waypoint1: to_geo })
      connection = Excon.new(base_url)
      route_object( connection.get(query: query).body )
    end

    private
    def base_url
      'http://route.cit.api.here.com/routing/7.2/calculateroute.json'
    end

    def auth_params
      { app_id: 'i6eH7aQVYK2RFCDfUOA5', app_code: 'R-s0s6ahDxkxOEXxrCzZAw' }
    end

    def default_attribs
      { routeattributes: 'none,sh,ri', mode: 'fastest;car;', resolution: '92' }
    end

    def route_object(res)
      res = JSON.parse( res )
      OpenStruct.new(res["response"]["route"].first)
    end
  end

end