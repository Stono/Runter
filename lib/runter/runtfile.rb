# Handles the read and write of the runt file
module Runter
  module Runtfile
    def load_settings()
      JSON.parse(IO.read('Runtfile'))
    end
  end
end
