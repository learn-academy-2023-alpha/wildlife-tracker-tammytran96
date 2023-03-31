require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    crocodile = Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodylidae')
    expect(crocodile).to be_valid
    end
  
    it 'is not valid without a common name' do
      crocodile = Animal.create(scientific_binomial: 'Crocodylidae')
      expect(crocodile.errors[:common_name]).to_not be_empty
    end

    it 'is not valid without a scientific binomial' do
      crocodile = Animal.create(common_name: 'Crocodile')
      expect(crocodile.errors[:scientific_binomial]).to_not be_empty
    end

    it 'is not valid if common name is not unique' do
      Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodylidae')
      crocodile = Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodylidae')
      expect(crocodile.errors[:common_name]).to_not be_empty
    end

    it 'is not valid if scientific binomial is not unique' do
      Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodylidae')
      crocodile = Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodylidae')
      expect(crocodile.errors[:scientific_binomial]).to_not be_empty
    end

    it 'is not valid if common name exactly matches scientific binomial' do
      crocodile = Animal.create(common_name: 'Crocodile', scientific_binomial: 'Crocodile')
      expect(crocodile.errors[:common_name]).to_not be_empty
    end

end
