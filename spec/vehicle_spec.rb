require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do

  describe 'Vehicle Class' do
    before(:each) do
      @vehicle = Vehicle.new("2001", "Honda", "Civic")
    end

    it 'exists' do
      expect(@vehicle).to be_an_instance_of(Vehicle)
    end

    it 'has attributes' do
      expect(@vehicle.year).to eq("2001")
      expect(@vehicle.make).to eq("Honda")
      expect(@vehicle.model).to eq("Civic")
      expect(@vehicle.passengers).to eq([])
    end

    it 'is not speeding by default but can speed' do
      expect(@vehicle.speeding?).to be(false)

      @vehicle.speed

      expect(@vehicle.speeding?).to be(true)
    end
  end
end
