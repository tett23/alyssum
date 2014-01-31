# coding: utf-8

require 'Qt'

require 'bundler'
Bundler.require
require 'active_support/core_ext'

Dir.glob('./lib/**/*.rb').each do |lib|
  require lib
end
Dir.glob('./app/**/*.rb').each do |lib|
  require lib
end

app = Qt::Application.new(ARGV)
App.instance.exec().show()
app.exec()
