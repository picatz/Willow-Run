module WillowRun

  class GeneratePsk 
    # contains the generated PSK when avaiable.
    attr_reader :psk
    
    # generate() will generate a PSK from 
    # a specified pass phrase and SSID passed in
    # as a hash.
    #
    # == Example
    #
    #  # Typical use
    #  WillowRun::GeneratePsk.new.generate(:ssid => "dogs", :password => "cats")
    #  # => "ddd3da4ed028b81de13ed6ec53238838755bf44e69365cc6453cdcb65d42406f"
    # 
    def generate(opts)
      if opts
        if opts[:ssid] and opts[:password]
          o, s = Open3.capture2("#{AIRPORT} -P --ssid #{opts[:ssid]} --password #{opts[:password]}")
          if s.success?
            @psk = o.strip
          else
            raise WillowRunError.new("Unable to generate psk with SSID: #{opts[:ssid]} and PASSWORD: #{opts[:password]}")
          end
        else
          raise WillowRunError.new("Unable to generate psk, requires both an ssid and password; only got: #{opts}.")
        end
      else
        raise WillowRunError.new("Unable to generate psk, requires both an ssid and password.")
      end
      @psk
    end
  end

end
