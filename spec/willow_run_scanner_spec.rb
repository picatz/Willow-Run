require "spec_helper"

describe WillowRun::Scanner do
  it "can scan without a provided ssid" do
    expect(WillowRun::Scanner.new.scan).not_to be false
  end

  context "with a provided ssid" do
    it "can scan with an known ssid" do
      scanner = WillowRun::Scanner.new
      known_ssid = scanner.scan.data[0].data.ssid_str
      expect(WillowRun::Scanner.new.scan(known_ssid)).not_to be false
    end  
  end

end
