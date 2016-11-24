require "willow_run/version"
require 'pry'
require 'open3'

module WillowRun
  # Path to the airport command.
  AIRPORT='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
 
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


end
