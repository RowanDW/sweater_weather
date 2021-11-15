require 'rails_helper'

RSpec.describe 'the Activity Poro' do

    it 'exists and has attributes' do
        activity_data = {
            activity: "Learn how to play a new sport",
            accessibility: 0.2,
            type: "recreational",
            participants: 1,
            price: 0.1,
            key: "5808228"
        }
        activity = Activity.new(activity_data)
        expect(activity).to be_a(Activity)
        expect(activity.title).to eq("Learn how to play a new sport")
        expect(activity.type).to eq("recreational")
        expect(activity.participants).to eq(1)
        expect(activity.price).to eq(0.1)
    end
end