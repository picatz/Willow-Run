module WillowRun

  class Parser 
    attr_accessor :data
    
    def initialize(data=false)
      @data = []
      if data
        parse(data)
      end
    end

    def parse(data)
      # The preferred way to store property lists on
      # OS X and iOS is as an XML file called an
      # XML property list or XML plist.
      parse_plist_xml(data)
    end

    private
    
    def parse_plist_xml(data)
      Plist::parse_xml(data).each do |ap_info|
        @data << AccessPoint.new(ap_info)
      end
    end
  end

end
