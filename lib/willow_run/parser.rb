module WillowRun

  # Parser contains the logic to do with parsing xml/plist
  # data for this gem. The parsed data is avaiable via
  # the data attribute which should contain an array
  # of AccessPoint objects after parsing. 
  # 
  # == Example
  #
  #  # Typical use for the Parser class
  #  parser = WillowRun::Parser.new
  #  data = parser.parse(plist_xml_data)
  # 
  class Parser 
    # You can either create a parser object with
    # or without data when it is iniatilized. 
    def initialize(data=false)
      parse(data) if data
    end

    # parse() handles the parsing of the general 
    # data associated with this gem where appropriate
    def parse(data)
      if data.is_a? Sniffer
        parse_sniffer_data(data) 
      else
        # The preferred way to store property lists on
        # OS X and iOS is as an XML file called an
        # XML property list or XML plist.
        parse_plist_xml(data)
      end
    end

    private

    # parse_plist_xml() hanldes the plist xml format
    # that actually is parse behind the seens to make the
    # parse method prettier really. 
    def parse_plist_xml(data)
      # Parse the xml with Plist and iterate over each
      # access point by creating a new access point.
      parsed_data = []
      Plist::parse_xml(data).each do |ap_info|
        ap = AccessPoint.new(ap_info)
        parsed_data << ap
      end
      parsed_data
    end

    # parse_sniffer_data() handles the tcpdump format
    # that is generated by the airport's sniffing 
    # ability using usual pcap tools.
    def parse_sniffer_data(data)
      # note: will not be able to parse every thing...
      # better than ruby-pcap which just fails for pcap
      # things it dosen't know how to handle.
      PacketFu::PcapFile.file_to_array data.file
    end
  end

end
