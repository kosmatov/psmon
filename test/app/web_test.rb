require 'test_helper'

module Test
  describe "Web extention" do
    include Rack::Test::Methods

    def app
      App::Web
    end

    it "display index" do
      get '/'
      last_response.status.must_equal 200, last_response.errors
    end

    it "kill process" do
      pid = fork { sleep 60 }

      delete '/', pid: pid
      last_response.status.must_equal 200, last_response.errors
    end
  end
end
