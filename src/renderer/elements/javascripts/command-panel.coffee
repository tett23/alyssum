Polymer 'x-command-panel',
  ready: ->
  search: ->
    query = @.$.search.value
    commands = ipc.sendSync 'search-command', query
    @.$.commands.clear()
    @.$.commands.setItems(commands)
