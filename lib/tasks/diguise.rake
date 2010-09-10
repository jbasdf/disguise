namespace :disguise do
  
  desc "Sync required files from disguise."
  task :sync do
    path = File.join(File.dirname(__FILE__), *%w[.. ..])
    system "rsync -ruv #{path}/db ."
  end
  
end