require 'rails_helper'

RSpec.describe OpenPeriod, type: :model do
  describe '#formatted' do
    it 'should format the date' do
      period = OpenPeriod.new(day: "Monday", time_from: "09:00", time_to: "05:00")
      expect(period.formatted).to eq 'Monday: 9:00am - 5:00pm'
    end
  end
end
