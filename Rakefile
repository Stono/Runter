namespace "gem" do

  desc "Cleans any old .gem files"
  task :clean do
    Dir["*.gem"].each {|item|
      puts "Removing: #{item}"
      File.delete(item)
    }
  end
 
  desc "Builds the gem package"
  task :build do
    puts "Building gem file..."
    puts %x[gem build #{Dir["*.gemspec"].first()}] 
  end
  
  desc "Installs the gem package"
  task :install do
    puts "Installing gem file..."
    puts %x[gem install #{Dir["*.gem"].first()} --no-document]
  end
 
  desc "Cleans, Builds and Installs the gem"
  task :cbi => ["gem:clean", "gem:build", "gem:install"]  do
    puts "Done."
  end
end
