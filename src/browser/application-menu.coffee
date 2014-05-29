app = require 'app'
ipc = require 'ipc'
Menu = require 'menu'
MenuItem = require 'menu-item'
Commands = require '../common/commands'

class ApplicationMenu
  constructor: (@window) ->
    if process.platform is 'darwin'
      @metaKey = 'Command'
    else
      @metaKey = 'Control'
    @menu = Menu.buildFromTemplate(@template())

  set: ->
    if process.platform != 'darwin'
      @window.setMenu(@menu)
    else
      Menu.setApplicationMenu(@menu)

  template: ->
    [
      {
        label: 'Alyssum'
        submenu: [
          {
            label: 'open command panel'
            accelerator: @metaKey+'+P'
            click: (_, webContents)->
              webContents.send('open-command-panel', null)
          }
          {
            label: 'quit'
            accelerator: @metaKey+'+Q'
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
            accelerator: @metaKey+'+Shift+C'
            click: =>
              @window.toggleDevTools()
          }
          {
            label: 'reload'
            accelerator: @metaKey+'+R'
            click: =>
              @window.reload()
          }
        ]
      }
    ]
module.exports = ApplicationMenu
