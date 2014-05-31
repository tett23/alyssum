alyssum = require('../renderer/javascripts/alyssum')

class FileItem
  constructor: (@filename, params) ->
    @type = params?.attributes?.type || 'text'
    @body = params?.attributes?.body || 'foo bar'

    @toHTML = ->
      el = alyssum.createComponent('file-item',
        attributes:
          filename: @filename
          type: @type
          body: @body
      )
      el

module.exports = FileItem
