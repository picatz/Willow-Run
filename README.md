# Willow Run ✈️ 

## ⚠️  Still in development! Should have working tests though!

#### ⚠️  Note: I've learned that `airport` sometimes dosen't handle BSSID values properly.

Willow Run is a Ruby API to the macOs/OSX `airport` command. The [airport](http://osxdaily.com/2007/01/18/airport-the-little-known-command-line-wireless-utility/) command manages 802.11 interfaces, can perform wireless broadcast scans ( with xml output support ), set arbitrary channels on the interface, and even generate PSKs from specified pass phrase and SSIDs -- all from the command-line, which I really love. 

## Installation

It will be  a [gem](https://rubygems.org/)! So, you'll be able to install it yourself pretty easily:

    $ gem install willow_run

## Purpose
This gem takes those capabilities provided by the `airpot` command and provides a Ruby API to be able use these functionalities in an [OO](https://en.wikipedia.org/wiki/Object-oriented_programming) manner, which I also really love. This provides better flexibility to build tools ontop of this tool; and can provide greater functionality for scripting or creating applications around various wireless taks this utility provides on macOS or OSX systems in Ruby, which I happen to use sometimes.

I can also just build better command-line applications with this interface, since I really enjoy building command-line application in Ruby. Maybe you'll find it useful too. 

### Why The Name?

[Willow Run](https://en.wikipedia.org/wiki/Willow_Run_Airport) is an airport located in Ypsilanti, Michigan. I go to school at [Eastern Michigan University](https://www.emich.edu/) which is also in Ypsilanti. So, it all works out like that.

![airport](https://upload.wikimedia.org/wikipedia/commons/3/34/Willow_Run_Airport_-_Michigan.jpg)

## Usage

This gem has lots of different functionality!

### Generate PSK

You can use the `airport -P` command to generate a PSK:

```ruby
require 'willow_run'

WillowRun::GeneratePsk.new.generate(:ssid => "cats", :password => "dogs")
# => "4e471f8d03afeca8a9d27f6a6358294ce0e89543880fad99498ac457e0b09341"
``` 

### Currect Access Point Information

You can use the `airprot -I` command to get current wireless status, e.g. signal info, BSSID, port type etc:

```ruby
require 'willow_run'

# get current wireless status
info = WillowRun::Status.new.getinfo

# note: osx/macOS totally fails and gives invalid/faulty BSSID values for this command
info.bssid
# => "6c:b0:ce:0b:ec:56"

# but generally, everything is fine and dandy!
info.ssid
# => "NETGEAR52"

# and things should generally be Integers when appropriate
info.channel
# => 11

```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

