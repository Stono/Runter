module Runter
  class Watcher
    def initialize(json) 
      @files         = []
      @name          = json["name"]
      @singleActions = json["singleFileActions"]
      @bulkActions   = json["bulkActions"]
      @files         = []
      load_files(json["src"])
    end
    def load_files(watchPaths)
      watchPaths.each{|path|
        Dir[path].each{|file|
          @files.push("./#{file}")
        }
      }
    end
    def get_watch_files() 
      return @files
    end
    def handle_change(file) 
      puts file
      if(@files.include?(file))
        perform_single_actions(file)
        perform_bulk_actions(file)
      end
    end
    def perform_single_actions(file)
      @singleActions.each{|action|
        action.gsub! "$1", file
        Runter::Shell.execute(action)
      }
    end
    def perform_bulk_actions(file)
      return if @bulkActions == nil
      @bulkActions.each{|action| 
        action.gsub! "$1", file
        puts action
      }
    end
  end
end