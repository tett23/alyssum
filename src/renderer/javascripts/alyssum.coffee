ipc = require 'ipc'

ipc.on 'open-command-panel', (args) ->
  commandPanel = document.getElementById('command-panel')
  if commandPanel?
    commandPanel.toggleDisplay()
    commandPanel.$.search.impl.focus()

ipc.on 'create-component', (params) ->
  prefix = params.prefix || 'x'
  el = document.createElement(prefix+'-'+params.element)
  el.id = params.id

  document.body.appendChild(el)
