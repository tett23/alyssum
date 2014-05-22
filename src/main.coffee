app = require 'app'
BrowserWindow = require 'browser-window'

ApplicationMenu = require './application-menu'
Commands = require './commands'

require('crash-reporter').start()

mainWindow = null

app.on 'window-all-closed', ->
  app.quit() if process.platform != 'darwin'

app.on 'ready', ->
  mainWindow = new BrowserWindow {width: 800, height: 600}

  mainWindow.loadUrl('file://' + __dirname + '/browser/index.html')
  mainWindow.setMenu(new ApplicationMenu(mainWindow).menu)

  mainWindow.on 'closed', ->
    mainWindow = null

console.send = (win, msg) ->
  win.webContents.on 'did-finish-load', ->
    win.webContents.send('send-console', msg)
