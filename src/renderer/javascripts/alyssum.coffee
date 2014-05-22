ipc = require 'ipc'
ipc.on 'open-command-panel', (args) ->
  console.log('open command panel')
