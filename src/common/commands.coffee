class Commands
  @commands = []

  @register: (command) ->
    @commands.push command

  @search: (query) ->
    @commands

module.exports = Commands
