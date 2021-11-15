class BoredFacade
    def self.get_activities_forecast(temp)
        activities = []
        activities << BoredService.get_activity(get_activity_type(temp))
        activities << BoredService.get_activity('relaxation')
        activities
    end

    private

    def self.get_activity_type(temp)
        if temp < 50
          "cooking"
        elsif temp >= 60
          "recreational"
        else
          "busywork"
        end
    end
end