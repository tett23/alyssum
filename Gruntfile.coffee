module.exports = (grunt) ->
  grunt.initConfig
    pkg: 'package.json',
    coffee:
      product:
        options:
          bare: true
        expand: true
        cwd: 'src'
        src: '**/*.coffee'
        dest: 'build/'
        ext: '.js'
    jade:
      product:
        options:
          pretty: true
        expand: true
        cwd: 'src'
        src: '**/*.jade'
        dest: 'build/'
        ext: '.html'
    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: ['coffee:product']
      jade:
        files: ['src/*.jade']
        tasks: ['jade:product']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'jade']
