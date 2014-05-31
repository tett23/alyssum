FileItem = require './file-item'

class FileTree
  @list = [new FileItem('testfile', {})]
  constructor: (@filename) ->

  @push: (fileItem) ->
    FileTree.list.push(fileItem)

  @search: (query) ->
    return FileTree.list
    FileTree.list[query]

module.exports = FileTree
