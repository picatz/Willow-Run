require "spec_helper"

describe WillowRun::Scanner do
  scanner = WillowRun::Scanner.new
  
  context "without a provided ssid" do
    it "can scan without a provided ssid" do
      expect(scanner.scan).not_to be false
    end

    it "can work with scanned access point data" do
      data = scanner.scan[0]
      expect(data.data).not_to be false
    end
  end

  context "with a provided ssid" do
    known_ssid = scanner.scan[0].data.ssid_str
    
    it "can scan with a known ssid" do
      expect(scanner.scan(known_ssid)).not_to be false
    end  
    
    it "can work with known scanned access point data" do
      expect(scanner.scan(known_ssid)).not_to be false
    end
  end
end
