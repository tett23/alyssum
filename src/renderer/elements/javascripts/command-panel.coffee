Polymer 'x-command-panel',
  ready: ->
    @.show = =>
      @.impl.style.visibility = 'visible'
    @.hide = =>
      @.impl.style.visibility = 'hidden'
    @.isShowing = =>
      @.impl.style.visibility isnt 'hidden'
    @.toggleDisplay = =>
      if @.isShowing() then @.hide() else @.show()

  search: ->
    query = @.$.search.value
    commands = ipc.sendSync 'search-command', query
    @.$.commands.clear()
    @.$.commands.setItems(commands)
