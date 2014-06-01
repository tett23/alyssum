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

    @fileAdd = alyssum.createComponent('button',
     id: 'file-add'
     element: 'button'
     attributes:
       text: 'add file'
       icon: null
     onClick: =>
       file = new FileItem('foo',
         attributes:
           type: 'text'
           body: 'aa'
       )
       file.onClick = ->
       @.$.items.appendChild(file.toHTML())
    )

    @reload()

    @.$.buttons.appendChild(@fileAdd)
