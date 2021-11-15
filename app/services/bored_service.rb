class BoredService
    class << self
        def get_activity(type)
          response = Faraday.get("http://www.boredapi.com/api/activity?type=#{type}")
          parse_json(response)
        end
    
        private
    
        def parse_json(response)
          JSON.parse(response.body, symbolize_names: true)
        end
    end
end