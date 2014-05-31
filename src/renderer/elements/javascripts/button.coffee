Polymer 'x-button',
  ready: ->
    @onClick = =>

  onClick: ->
    @onClick()
    console.log(arguments)

