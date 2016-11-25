$: << File.expand_path("../../lib", __FILE__)
require 'willow_run'

# make new sniffer object
sniffer = WillowRun::Sniffer.new

# start sniffing
# The default timeout after 5 seconds
# has been set to 10 seconds.
sniffer.sniff(:timeout => 10)

# get the capture file path that was generated
sniffer.file
# => /tmp/airportSniff9wFMP4.cap
