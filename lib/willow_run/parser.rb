module WillowRun

  # Parser contains the logic to do with parsing xml/plist
  # data for this gem. The parsed data is avaiable via
  # the data attribute which should contain an array
  # of AccessPoint objects after parsing. 
  # 
  # == Example
  #
  #  # Typical use for the Parser class
  #  parser = WillowRun::Parser.new.parse(plist_xml_data)
  #  parser.data.count
  #  # => 1
  #  parser.data[0]
  #  # => WillowRun::AccessPoint object
  # 
  class Parser 
    # data contains all of the access points
    # that are parsed with this class.
    attr_accessor :data
   
    # You can either create a parser object with
    # or without data when it is iniatilized. 
    def initialize(data=false)
      @data = []
      parse(data) if data
    end

    # parse() handles the parsing acess points
    # found during a wireless broadcast scan using
    # the Scanner class typically for this gem.
    def parse(data)
      # The preferred way to store property lists on
      # OS X and iOS is as an XML file called an
      # XML property list or XML plist.
      parse_plist_xml(data)
    end

    private
   
    # parse_plist_xml() hanldes the plist xml format
    # that actually is parse behind the seens to make the
    # parse method prettier really. 
    def parse_plist_xml(data)
      # Parse the xml with Plist and iterate over each
      # access point by creating a new access point.
      Plist::parse_xml(data).each do |ap_info|
        @data << AccessPoint.new(ap_info)
      end
    end
  end

end
