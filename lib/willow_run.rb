require "willow_run/airport"
require "willow_run/scanner"
require "willow_run/parser"
require "willow_run/errors"
require "willow_run/version"
require 'pry'
require 'open3'
require 'nokogiri'

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


end
