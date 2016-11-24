require "spec_helper"

describe WillowRun do
  it "has a version number" do
    expect(WillowRun::VERSION).not_to be nil
  end

  it "has a path to the default Mach-O 64-bit executable" do
    expect(WillowRun::AIRPORT).not_to be nil
  end
 
  it "can resolve the Mach-O 64-bit executable to prove it's avaiable" do
    expect(WillowRun.find_the_airport?).to eq(true)
  end

  it "can run the Mach-O 64-bit executable to prove it's runnable" do
    expect(WillowRun.take_off?).to eq(true)
  end

end
