require 'sinatra/base'
require 'sys/proctable'

module App
  class Web < Sinatra::Base
    include Sys

    set :root, File.expand_path('../../', __FILE__)
    set :views, -> { "#{root}/views" }

    get '/' do
      @process_list = ProcTable.ps
      slim :index
    end

    delete '/' do
      pid = params[:pid].to_i
      begin
        Process.kill('QUIT', pid)
        status 200
      rescue Errno::EPERM
        status 403
      rescue
        status 404
      end
    end
  end
end
