require 'rails_helper'

RSpec.describe Sighting, type: :model do
    it 'is not valid without a latitude' do
      sighting = Sighting.create(longitude: 74, date: "2023-02-02")
      expect(sighting.errors[:latitude]).to_not be_empty
    end

    it 'is not valid without a longitude' do
      sighting = Sighting.create(latitude: 74, date: "2023-02-02")
      expect(sighting.errors[:longitude]).to_not be_empty
    end

    it 'is not valid without a date' do
      sighting = Sighting.create(latitude: 74, longitude: 74)
      expect(sighting.errors[:date]).to_not be_empty
    end
end
