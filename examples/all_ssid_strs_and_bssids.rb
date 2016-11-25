$: << File.expand_path("../../lib", __FILE__)
require 'willow_run'

# make new scanner object
scanner = WillowRun::Scanner.new

# scan with that scanner object
# but only get the first access point
# if it exists
ap_data = scanner.scan.data

unless ap_data.empty?
  puts "-" * 40
  puts "%-20s |\t%s" % [ "BSSID", "SSID" ]
  puts "-" * 40
  ap_data.each do |access_point|
    data = access_point.data
    puts "%-20s |\t%s" % [ data.bssid, data.ssid_str ]
  end
else
  puts "Unable to find any access points!"
  exit 1  
end


