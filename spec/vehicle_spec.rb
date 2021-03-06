require './lib/vehicle'
require './lib/passenger'

RSpec.describe Vehicle do

  describe 'Vehicle Class' do
    before(:each) do
      @vehicle = Vehicle.new("2001", "Honda", "Civic")
      @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
      @jude = Passenger.new({"name" => "Jude", "age" => 20})
      @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
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

    it 'can add passengers' do
      expect(@vehicle.passengers).to eq([])

      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)

      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end

    it 'can count the number of adults' do
      expect(@vehicle.num_adults).to eq(0)

      @vehicle.add_passenger(@charlie)

      expect(@vehicle.num_adults).to eq(1)

      @vehicle.add_passenger(@taylor)

      expect(@vehicle.num_adults).to eq(1)

      @vehicle.add_passenger(@jude)

      expect(@vehicle.num_adults).to eq(2)
    end
  end
end
