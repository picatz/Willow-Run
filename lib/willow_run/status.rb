module WillowRun
	class Status
    # data contains information about the wireless status, 
    # e.g. signal info, BSSID, port type etc. provided 
    # by the airport command.
    attr_reader :data
    
    # getinfo() get the current information associated
    # with the access point that the computer is already
    # connected to. 
    def getinfo
      o, s = Open3.capture2("#{AIRPORT} -I")
      if s.success?
        data = o.split("\n").map(&:strip)
        hashed_data = {}
        data.each do |info|
          key, value = info.gsub(' ','_').split(":_")
          key = key.gsub(':','').gsub('.','').downcase
          key = "wifi_auth" if key == "80211_auth"
          value = Integer(value) rescue value
          hashed_data[key] = value
        end
        @data = OpenStruct.new(hashed_data) 
      else
        # custom error?
        return false
      end
      @data
    end
  end
end
