module WillowRun

  # Sniffing contains the logic to do with sniffing
  # 802.11 frames on an interface using the airport
  # command's sniff verb.
  # 
  # == Example
  #
  #  # Typical use for the Parser class
  #  sniffer = WillowRun::Sniffer.new
  #  # sniff for 30 seconds
  #  sniffer.sniff(:time => 30)
  #  
  class Sniffer 
    # file contains the path to the tcpdump capture file
    # version 2.4, 802.11 with radiotap header
    attr_accessor :file
    # pcap contains the parsed tcpdump data
    attr_accessor :pcap
    # interface is the interface to capture on
    attr_accessor :interface

    # You can either create a parser object with
    # or without data when it is iniatilized. 
    def initialize(opts=false)
      if opts
        if opts[:file]
          unless File.exists?(opts[:file])
            raise WillowRunError.new("#{opts[:file]} doesn't seem to exist!")
          else
            @file = opts[:file]
          end
          return true
        end
        if opts[:sniff]
          if opts[:channel] and opts[:interface]
            sniff(opts[:channel],opts[:interface])
          elsif opts[:interface]
            sniff("",opts[:interface])
          elsif opts[:channel]
            sniff(opts[:channel])
          else
            sniff
          end
        end
      end
      true
    end

    # sniff() alllows the capturing packets, as long as
    # the process as the correct privelleges. Optionally,
    # a set of options can be passed in as a hash to set
    # custom parameters for the sniffing. A default of 5
    # seconds has been given to the sniff method, whereafter
    # the sniffing will stop / the process PID be killed.
    def sniff(opts=false)
      if Process.uid == 0
        if opts
          interface = opts[:interface] if opts[:interface]
          channel = opts[:channel] if opts[:channel]
          timeout = opts[:timeout] if opts[:timeout]
        end
        interface = default_interface unless interface
        channel = "" unless channel
        timeout = 5 unless timeout
        stdin, stdout, stderr, wait_thr = Open3.popen3("#{AIRPORT} #{interface} sniff #{channel}")
        sleep(timeout.to_i)
        if Process.kill("KILL", wait_thr.pid)
          @file = determine_cap_file
          @pcap = Parser.new.parse(self)
        else
          raise WillowRunError.new("unable to kill pid #{wait_thr.pid}")
        end
      else
        raise WillowRunError.new("sniffing must be done with root!")
      end
      self
    end

    # Determine the default ip address, taken from packetfu's utils.rb
    def default_ip
      begin
        orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true  # turn off reverse DNS resolution temporarily
        UDPSocket.open do |s|
          s.connect rand_routable_daddr.to_s, rand_port
          s.addr.last
        end
      ensure
        Socket.do_not_reverse_lookup = orig
      end
    end

    # Determine the default routeable interface, taken from packetfu's utils.rb
    def default_interface
      ip = default_ip
      Socket.getifaddrs.each do |ifaddr|
        next unless ifaddr.addr.ip?
        return ifaddr.name if ifaddr.addr.ip_address == ip
      end
      # Fall back to libpcap as last resort
      return Pcap.lookupdev
    end

    private

    # Since 177/8 is IANA reserved (for now), this network should
    # be handled by your default gateway and default interface.
    # Taken from packetfu's utils.rb logic.
    def rand_routable_daddr
      IPAddr.new((rand(16777216) + 2969567232), Socket::AF_INET)
    end

    # A helper for getting a random port number, taken from packetfu's utils.rb
    def rand_port
      rand(0xffff-1024)+1024
    end

    # Since the airport command on Apple's part has no easy way to access 
    # the file name/path for the pcap that is generated during
    # the sniffing process. By default, and without any options, the
    # pcap file will be generated in /tmp as *.cap file with a random
    # name associated with it.
    def determine_cap_file
      # We use the most recently modified file, best we can really
      # do in this case.
      Dir.glob("/tmp/*.cap").max_by {|f| File.mtime(f)}
    end
  end

end
