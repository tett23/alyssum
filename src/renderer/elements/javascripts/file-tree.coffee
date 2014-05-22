Polymer 'x-file-tree',
  ready: ->
    @reload = () =>
      fileTree = ipc.sendSync 'get-file-tree'
      for file in fileTree
        el = document.createElement('x-file-item')
        el.filename = file.name
        el.setAttribute('filename', file.name)
        @.$.items.appendChild(el)
    @clear = () =>
      @.$.items.innerHTML = ''

    @reload()
