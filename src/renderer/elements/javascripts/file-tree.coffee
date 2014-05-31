ipc = require 'ipc'
Polymer 'x-file-tree',
  ready: ->
    @reload = () =>
      fileTree = (require('ipc')).sendSync 'get-file-tree'
      for file in fileTree
        el = document.createElement('x-file-item')
        el.setAttribute('filename', file.name)
        @.$.items.appendChild(el)
    @clear = () =>
      @.$.items.innerHTML = ''

    @reload()
