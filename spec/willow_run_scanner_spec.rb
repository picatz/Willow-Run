require "spec_helper"

describe WillowRun::Scanner do
  it "can scan without a provided ssid" do
    expect(WillowRun::Scanner.new.scan).not_to be false
  end
end
