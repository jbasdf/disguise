require 'rake'
require 'rake/tasklib'
require 'fileutils'

module Disguise
  class Tasks < ::Rake::TaskLib
    def initialize
      define
    end
  
    private
    def define
      namespace :disguise do
        
        task :app_env do
          Rake::Task[:environment].invoke if defined?(RAILS_ROOT)
        end

        desc "Setup disguise"
        task :setup => :sync do

        end
        
        desc "Sync required files from disguise."
        task :sync do
          path = File.join(File.dirname(__FILE__), *%w[.. ..])
          system "rsync -ruv #{path}/db ."
        end
        
      end
    end
  end
end
Disguise::Tasks.new