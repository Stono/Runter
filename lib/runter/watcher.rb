module Runter
  class Watcher
    def initialize(json) 
      @files         = []
      @name          = json["name"]
      @singleActions = json["singleFileActions"]
      @bulkActions   = json["bulkdActions"]
      @watchDirs     = json["src"]
      load_files()
    end
    def load_files()
      @watchDirs.each{|path|
        @files << Dir[path]
      }
    end
    def get_watch_dirs() 
      return @watchDirs
    end
    def handle_change(file) 
      puts "Handling #{file}"
    end
  end
end