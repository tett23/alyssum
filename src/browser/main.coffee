ipc = require 'ipc'
app = require 'app'
BrowserWindow = require 'browser-window'

ApplicationMenu = require './application-menu'
ApplicationCommand = require './application-command'
FileItem = require '../common/file-item'
Commands = require '../common/commands'
Command = require '../common/command'

require('crash-reporter').start()

mainWindow = null

app.on 'window-all-closed', ->
  app.quit() if process.platform != 'darwin'

app.on 'ready', ->
  mainWindow = new BrowserWindow {width: 1280, height: 720}
  mainWindow.components = []

  mainWindow.loadUrl('file://' + __dirname + '/../renderer/index.html')
  menu = new ApplicationMenu(mainWindow)
  menu.set()
  ApplicationCommand.setup()

  mainWindow.webContents.on 'did-finish-load', ->
    mainWindow.webContents.send('create-component', element: 'file-tree', id: 'file-tree')
    mainWindow.webContents.send('create-component', element: 'command-panel', id: 'command-panel')
    mainWindow.webContents.send('create-component', element: 'buffers-panel', id: 'buffers')

  mainWindow.on 'closed', ->
    mainWindow = null

ipc.on 'execute-command', (event, args) ->
  event.returnValue = Commands.execute(args)

ipc.on 'search-command', (event, args) ->
  event.returnValue = Commands.search(args)

ipc.on 'get-file-tree', (event, args) ->
  event.returnValue = Commands.execute('get-file-tree')

ipc.on 'created-element', (event, params) ->
  mainWindow.components.push(params)
