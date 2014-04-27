# Handles the read and write of the runt file
module Runter

  class Runtfile
    def initialize()
      @watchers = []
      load_settings()
    end

    def load_settings()
      if !File.file?('Runtfile')
        raise 'You must created a Runtfile before running runter!'
      end
      JSON.parse(IO.read('Runtfile'))["watchers"].each {|watch|
        @watchers << Runter::Watcher.new(watch)
      }
    end
    def get_watchers() 
      return @watchers
    end
  end

end
