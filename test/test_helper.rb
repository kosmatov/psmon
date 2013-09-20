require 'coveralls'
Coveralls.wear! do
  add_filter '/test/'
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

require 'bundler/setup'
require 'rack/test'

require './app'

Bundler.require
