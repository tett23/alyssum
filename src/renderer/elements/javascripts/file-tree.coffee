alyssum = require './javascripts/alyssum'
FileItem = require '../common/file-item'
FileTree = require '../common/file-tree'

Polymer 'x-file-tree',
  ready: ->
    @reload = () =>
      fileTree = FileTree.list
      for file in fileTree
        @.$.items.appendChild(file.toHTML())

    @clear = () =>
     @.$.items.innerHTML = ''

    @reload()

    @fileAdd = alyssum.createComponent('button',
     id: 'file-add'
     element: 'button'
     attributes:
       text: 'add file'
       icon: null
     onClick: =>
       file = new FileItem('foo', {type: 'text', body: 'aa'})
       @.$.items.appendChild(file)
    )
    @.$['menu-buttons'].appendChild(@fileAdd)
