class Commands
  @commands = []

  @register: (command) ->
    @commands.push command

  @search: (query) ->
    @commands

  @execute: (name, args) ->
    command = null
    for cmd in @commands
      if cmd.name == name
        command = cmd
        break

    command?.exec(args)

module.exports = Commands
