Polymer 'x-text-buffer',
  created: ->
    @super()

    @open = (fileItem) =>
      @super()
      @.$.body.value = fileItem.body

