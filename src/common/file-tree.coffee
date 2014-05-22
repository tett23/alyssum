FileItem = require './file-item'

class FileTree
  constructor: (@name) ->
  @list: ->
    [new FileItem('testfile')]

module.exports = FileTree
