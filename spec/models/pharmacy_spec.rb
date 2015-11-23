require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  describe '#open_periods_formatted' do
    it 'should format all open periods' do
      pharmacy = Pharmacy.new(name: "Balmain")
      allow(pharmacy).to receive_messages(open_periods: [
        object_double(OpenPeriod.new, formatted: "Monday: 9am - 5pm"),
        object_double(OpenPeriod.new, formatted: "Tuesday: 9am - 5pm"),
      ])
      expect(pharmacy.open_periods_formatted).to eq "Monday: 9am - 5pm\nTuesday: 9am - 5pm"
    end

    it 'should use a factory' do
      pharmacy = FactoryGirl.create(:pharmacy, open_periods: [
        FactoryGirl.build(:open_period, day: "Monday", time_from: '09:00'),
        FactoryGirl.build(:open_period, day: "Tuesday", time_from: '09:00'),
      ])
      expect(pharmacy.open_periods_formatted).to eq "Monday: 9am - 5pm\nTuesday: 9am - 5pm"
    end
  end
end
