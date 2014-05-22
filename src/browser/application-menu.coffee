app = require 'app'
ipc = require 'ipc'
Menu = require 'menu'
MenuItem = require 'menu-item'
Commands = require './common/commands'

class ApplicationMenu
  constructor: (@window) ->
    @menu = Menu.buildFromTemplate(@template())

  template: ->
    [
      {
        label: 'Alyssum'
        submenu: [
          {
            label: 'open command panel'
            accelerator: 'Control+P'
            click: (_, webContents)->
              webContents.send('open-command-panel', null)
          }
          {
            label: 'quit'
            accelerator: 'Control+Q'
            click: =>
              app.quit()
          }
        ]
      }
      {
        label: 'Debug'
        submenu: [
          {
            label: 'dev tool'
            accelerator: 'Control+Shift+C'
            click: =>
              @window.toggleDevTools()
          }
        ]
      }
    ]
module.exports = ApplicationMenu
