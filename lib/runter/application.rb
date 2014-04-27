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
       dirsToWatch = []
       @runtFile.get_watchers().each{|watcher| 
         dirsToWatch.push(*watcher.get_watch_dirs())   
       }
       FileWatcher.new(dirsToWatch).watch() do |filename, event|
         puts "Detected change: #{filename}"  
       end 
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
