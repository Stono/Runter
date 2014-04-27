require 'pty'
module Runter
  module Shell
    def execute(command) 
      begin
        PTY.spawn(command) do |stdin, stdout, pid|
          begin
            stdin.each { |line| print line }
          rescue Errno::EIO
          end
        end
      rescue PTY::ChildExited
        puts "The child process exited!"
      end
    end
    module_function :execute
  end
end