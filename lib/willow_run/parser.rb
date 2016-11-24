module WillowRun

  class Parser 
    attr_accessor :data

    def initialize(data=false)
      if data
        @data = parse(data)
      else
        @data = false
      end
    end

    def parse(data)
      binding.pry
    end
  end

end
