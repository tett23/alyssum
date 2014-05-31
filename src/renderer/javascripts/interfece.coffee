ipc = require 'ipc'
alyssum = require './alyssum'

ipc.on 'open-command-panel', (args) ->
  alyssum.openCommandPanel()
