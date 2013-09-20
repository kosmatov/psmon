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
      if pid > 0 && Process.kill('QUIT', pid)
        status 200
      else
        status 404
      end
    end
  end
end
