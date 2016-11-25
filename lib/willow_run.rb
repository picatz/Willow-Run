require 'ostruct'
require 'plist'
require 'open3'
require 'socket'
require 'packetfu'
require 'plist'
require "willow_run/airport"
require "willow_run/access_point"
require "willow_run/generate_psk"
require "willow_run/scanner"
require "willow_run/sniffer"
require "willow_run/parser"
require "willow_run/status"
require "willow_run/errors"
require "willow_run/version"

module WillowRun
 
  # find_the_airport?() will help determine if the airport
  # Mach-O 64-bit executable is avaiable to us or not. 
  def self.find_the_airport?
    File.exist?(AIRPORT) ? true : false
  end
   
  # take_off?() can help determine if the airport
  # command is accessible or not if we run it.
  def self.take_off?
    Open3.capture2(AIRPORT).last.success?
  end

  # set_channel() allows a user to set a
  # arbitrary channel on the card.
  def self.set_channel(channel)
    o, s = Open3.capture2("#{AIRPORT} -c #{channel}")
    s.success? ? true : false
  end

  # disassociate() allows a user to simply
  # disassociate from any network, requiring
  # root/sudo privilleges
  def self.disassociate
    unless Process.uid == 0
      o, s = Open3.capture2("#{AIRPORT} -z")
      unless o == "root required to disassociate\n"
        return true
      end
      raise WillowRunError.new(o)
      false  
    end
  end

end
