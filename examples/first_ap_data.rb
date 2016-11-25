$: << File.expand_path("../../lib", __FILE__)
require 'willow_run'
require 'pry'

# make new scanner object
scanner = WillowRun::Scanner.new

# scan with that scanner object
# but only get the first access point
# if it exists
ap = scanner.scan.data[0] || false

# if there is any data to work with
if ap
  ap.data.each_pair do |key,value|
    puts "#{key} : #{value}"
  end
else
  # otherwise just error out
  puts "Unable to find any access points!"
  exit 1  
end


