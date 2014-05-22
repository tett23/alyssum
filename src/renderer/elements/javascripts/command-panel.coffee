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

  keyUpSearch: (event) ->
    if event.keyIdentifier == 'Enter'
      ret = ipc.sendSync 'execute-command', @.$.search.value
      console.log(ret)
    else
      query = @.$.search.value
      commands = ipc.sendSync 'search-command', query
      @.$.commands.clear()
      @.$.commands.setItems(commands)
