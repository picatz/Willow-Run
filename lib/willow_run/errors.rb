module WillowRun

	# WillowRunError handles the custom error handling for this Gem
  #
  # == Example
  #
  #  # Typical use case
  #  raise WillowRunError.new("This is a custom error!")
  #
	class WillowRunError < StandardError
    attr_reader :problem
    def initialize(problem="Willow Run seems to have encountered a problem.")
      @problem = problem
      super(@problem)
    end
  end

end
