require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  describe '#open_periods_formatted' do
    it 'should format all open periods' do
      pharmacy = Pharmacy.new(name: "Balmain")
      allow(pharmacy).to receive_messages(open_periods: [
        object_double(OpenPeriod.new, day: "Monday", time_from: Time.new(2000, 1, 1, 9, 0)),
        object_double(OpenPeriod.new, day: "Tuesday", time_from: Time.new(2000, 1, 1, 9, 0)),
      ])
      expect(pharmacy.open_periods_formatted).to eq "Monday: 9am - 5pm\nTuesday: 9am - 5pm"
    end
  end
end
