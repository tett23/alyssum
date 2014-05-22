Polymer 'x-command-list',
  ready: ->
    @.setItems = (commands) =>
      commands = [commands] unless commands instanceof Array

      for command in commands
        el = document.createElement('x-command-item')
        el.setAttribute('command', command.name)
        el.setAttribute('description', command.options.description)
        @.$.commands.appendChild(el)
    @.clear = () =>
      @.$.commands.innerHTML = ''
