Polymer 'x-text-buffer',
  created: ->
    @super()

    @open = (fileItem) =>
      @.$.body.value = fileItem.body

