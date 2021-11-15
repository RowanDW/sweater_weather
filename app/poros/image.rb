class Image
    attr_reader :url, :author
    def initialize(image_data)
        @url = image_data[:urls][:regular]
        @author = image_data[:user][:name]
    end
end