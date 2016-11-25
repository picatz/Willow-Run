require "spec_helper"

describe WillowRun::GeneratePsk do
  it "can generate a psk from a given ssid and pass phrase" do
    psk = WillowRun::GeneratePsk.new.generate(:ssid => "dogs", :password => "cats")
    expect(psk).to match("ddd3da4ed028b81de13ed6ec53238838755bf44e69365cc6453cdcb65d42406f")
  end
end
