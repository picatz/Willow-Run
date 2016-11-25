module WillowRun

  class Scanner
    def initialzie(opts=false)
      if opts[:scan]
        if opts[:ssid]
          scan(opts[:ssid])
        else
          scan
        end
      end
      true
    end

    def scan(ssid="")
      o, s = Open3.capture2("#{AIRPORT} -x -s '#{ssid}'")
      manage_output(o, s)
    end 

    def manage_output(stdout, status)
      if status.success?
        Parser.new.parse(stdout)
      else
        # custom error?
        false
      end 
    end
  end

end
