class Activity
    attr_reader :title, :type, :participants, :price
    def initialize(activity_data)
        @title = activity_data[:activity]
        @type = activity_data[:type]
        @participants = activity_data[:participants]
        @price = activity_data[:price]
    end
end