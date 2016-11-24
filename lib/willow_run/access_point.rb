module WillowRun

  class AccessPoint
    attr_accessor :data

    def initialize(xml_plist)
      struct_data = Hash[xml_plist.map{ |k, v| [k.downcase, v] }]
      @data = OpenStruct.new(struct_data)
    end
  end

end
