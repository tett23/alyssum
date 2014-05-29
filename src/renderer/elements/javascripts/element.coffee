Polymer 'x-element',
  created: ->
  ready: ->
    console.log('hoge')
    ipc.send 'created-component', @

