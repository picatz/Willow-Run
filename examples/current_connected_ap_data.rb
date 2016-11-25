$: << File.expand_path("../../lib", __FILE__)
require 'willow_run'

# get current wireless status, e.g. signal info, BSSID, port type etc.
info = WillowRun::Status.new.getinfo

# print out that information all purtty like
# closely mimics the `airport -I` command
puts "agrCtlRSSI      : " + info.agrctlrssi.to_s
puts "agrExtRSSI      : " + info.agrextrssi.to_s
puts "agrCtlNoise     : " + info.agrctlnoise.to_s
puts "agrExtNoise     : " + info.agrextnoise.to_s
puts "state           : " + info.state.to_s
puts "op mode         : " + info.op_mode.to_s
puts "lastTxRate      : " + info.lasttxrate.to_s
puts "maxRate         : " + info.maxrate.to_s
puts "lastAssocStatus : " + info.lastassocstatus.to_s
puts "802.11 auth     : " + info.wifi_auth.to_s
puts "link auth       : " + info.link_auth.to_s
puts "BSSID           : " + info.bssid.to_s
puts "SSID            : " + info.ssid.to_s
puts "MCS             : " + info.mcs.to_s
puts "channel         : " + info.channel.to_s
