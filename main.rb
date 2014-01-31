# coding: utf-8

require 'Qt'

require 'bundler'
Bundler.require
require 'active_support/core_ext'

Dir.glob('./app/**/*.rb').each do |lib|
  require lib
end

app = Qt::Application.new(ARGV)
Alyssum.show()
app.exec()
