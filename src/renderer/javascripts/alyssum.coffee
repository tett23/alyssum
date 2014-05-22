ipc = require 'ipc'
ipc.on 'open-command-panel', (args) ->
  commandPanel = document.getElementById('command-panel')
  if commandPanel?
    commandPanel.toggleDisplay()
    commandPanel.$.search.impl.focus()
