app = require 'app'
ipc = require 'ipc'
Command = require '../common/command'
Commands = require '../common/commands'
FileTree = require '../common/file-tree'
FileItem = require '../common/file-item'

class ApplicationCommand
  @setup: () ->
    Commands.register new Command('quit', () ->
      app.quit()
    , {description: 'quit application'})
    Commands.register new Command('get-file-tree', () ->
      return FileTree.search()
    , {description: 'get file tree'})

module.exports = ApplicationCommand
