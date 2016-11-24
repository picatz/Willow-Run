module WillowRun

  class Scanner
    attr_accessor :filter

    def initialzie(opts=false)
      if opts
        parse_opts(opts)
      end
    end

    def parse_opts(opts)
      if opts
        @filter = opts[:ssid] || false
        return true
      else
        return false
      end
    end

    def scan(opts=false)
      if opts
        if opts[:ssid]
        else
          return false
        end
      else
        
      end
    end 


  end

end
