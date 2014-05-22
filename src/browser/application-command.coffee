app = require 'app'
ipc = require 'ipc'
Command = require '../common/command'
Commands = require '../common/commands'

class ApplicationCommand
  @setup: () ->
    Commands.register new Command('quit', () ->
      app.quit()
    , {description: 'quit application'})

module.exports = ApplicationCommand
