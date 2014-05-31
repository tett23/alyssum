ipc = require 'ipc'
alyssum = require './javascripts/alyssum'

ipc.on 'open-command-panel', (args) ->
  alyssum.openCommandPanel()
