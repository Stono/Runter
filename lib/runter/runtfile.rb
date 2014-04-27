# Handles the read and write of the runt file
module Runter
  class Watcher
    def initialize(json) 
      @files         = []
      @name          = json["name"]
      @singleActions = json["singleFileActions"]
      @bulkActions   = json["bulkdActions"]
      load_files(json["src"])
    end
    def load_files(paths)
      paths.each{|path|
        @files << Dir[path]
      }
    end
  end

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
