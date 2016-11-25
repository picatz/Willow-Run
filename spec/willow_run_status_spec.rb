require "spec_helper"

describe WillowRun::Status do
  info = WillowRun::Status.new.getinfo
  it "can parse the current wireless status, get the information" do
    expect(WillowRun::Status.new.getinfo).not_to be false
  end

  it "can access the current wireless agrCtlRSSI information" do
    expect(info.agrctlrssi).not_to be nil
  end

  it "can access the current wireless agrExtRSSI information" do
    expect(info.agrextrssi).not_to be nil
  end
  
  it "can access the current wireless agrCtlNoise information" do
    expect(info.agrctlnoise).not_to be nil
  end

  it "can access the current wireless state information" do
    expect(info.state).not_to be nil
  end

  it "can access the current wireless op mode information" do
    expect(info.op_mode).not_to be nil
  end

  it "can access the current wireless lastTxRate information" do
    expect(info.lasttxrate).not_to be nil
  end

  it "can access the current wireless maxRate information" do
    expect(info.maxrate).not_to be nil
  end

  it "can access the current wireless lastAssocStatus information" do
    expect(info.lastassocstatus).not_to be nil
  end

  it "can access the current wireless 802.11 auth information" do
    expect(info.wifi_auth).not_to be nil
  end

  it "can access the current wireless link auth information" do
    expect(info.link_auth).not_to be nil
  end
  
  it "can access the current wireless BSSID information" do
    expect(info.bssid).not_to be nil
  end

  it "can access the current wireless SSID information" do
    expect(info.ssid).not_to be nil
  end

  it "can access the current wireless MCS information" do
    expect(info.mcs).not_to be nil
  end
  
  it "can access the current wireless channel information" do
    expect(info.channel).not_to be nil
  end

end
