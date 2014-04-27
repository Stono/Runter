# Handles the read and write of the runt file
module Runter

  class Application
     def initialize
       @name      = "runter"
       @runtFile  = Runter::Runtfile.new
     end

     def run
       puts "Runter started..."
     end
  end
 
  class << self
    def application
      @application ||= Runter::Application.new
    end
    def application=(app)
      @application = app
    end
  end

end
