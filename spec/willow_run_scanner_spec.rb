require "spec_helper"

describe WillowRun::Scanner do
  scanner = WillowRun::Scanner.new
  
  context "without a provided ssid" do
    data = scanner.scan.data

    it "can scan without a provided ssid" do
      expect(scanner.scan).not_to be false
    end

    it "can work with access point data" do
      expect(data).not_to be false
    end
  end
  
  context "with a provided ssid" do
    it "can scan with a known ssid" do
      known_ssid = scanner.scan.data[0].data.ssid_str
      expect(scanner.scan(known_ssid)).not_to be false
    end  
  end
end
