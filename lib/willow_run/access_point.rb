module WillowRun

  # AccessPoint maintains the logic to do with
  # the access points found during a scan. Data
  # asccoiated with an access point is avaiable via
  # the data attr_accessor associated with it.
  #
  # == Example
  #
  #  # Typical use
  #  ap = AccessPoint(xml_pist_data_from_scan)
  #  # access that access point's data
  #  ap.data
  #  # get the bssid of the access point
  #  ap.data.bssid
  #  # => "6c:b0:ce:b:ec:56"
  #  # get the channel of the access point
  #  ap.data.channel
  #  # => 11
  #  # get the ssid string associated with the ap
  #  ap.data.ssid_str
  #  # => "NETGEAR53"
  #
  class AccessPoint
    # data contains the OpenStruct data for the AccessPoint
    attr_accessor :data

    def initialize(xml_plist)
      # downcase the main keys of the hash to be
      # able to turn them into methods using OpenStruct
      struct_data = Hash[xml_plist.map{ |k, v| [k.downcase, v] }]
      # parse the data by storing data it into an OpenStruct
      @data = OpenStruct.new(struct_data)
    end
  end

end
