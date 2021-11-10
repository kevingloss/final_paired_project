require './lib/passenger'

RSpec.describe Passenger do

  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@charlie).to be_an_instance_of(Passenger)
      expect(@taylor).to be_an_instance_of(Passenger)
    end

    it 'has attributes' do
      expect(@charlie.name).to eq("Charlie")
      expect(@charlie.age).to eq(18)
    end
  end

  describe '#adult?' do
    it 'checks to see if the passenger is 18 or older' do
      expect(@charlie.adult?).to be(true)
      expect(@taylor.adult?).to be(false)
    end
  end

  describe '#driver?' do
    it 'returns true if the passenger is the driver' do
      expect(@charlie.driver?).to be(false)
    end
  end

  describe '#drive' do
    it 'makes the passenger the driver if they are an adult' do
      @charlie.drive

      expect(@charlie.driver?).to be(true)

      @taylor.drive

      expect(@taylor.driver?).to be(false)
      expect(@charlie.driver?).to be(true)
    end
  end

end
