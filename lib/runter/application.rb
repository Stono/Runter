# Handles the read and write of the runt file
require 'filewatcher'
module Runter

  class Application
     def initialize
       @name      = "runter"
       @runtFile  = Runter::Runtfile.new
     end

     def run
       puts "Runter started..."
       start_watch()
     end

     def start_watch() 
       filesToWatch = []
       @runtFile.get_watchers().each{|watcher| 
         filesToWatch.push(*watcher.get_watch_files())
       }
       FileWatcher.new(filesToWatch).watch() do |filename, event|
         handle_change(filename)  
       end 
     end

     def handle_change(file)
       @runtFile.get_watchers().each{|watcher|
         watcher.handle_change(file)
       }
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
