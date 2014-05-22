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
    stylus:
      product:
        expand: true
        cwd: 'src'
        src: '**/*.styl'
        dest: 'build/'
        ext: '.css'
    watch:
      coffee:
        files: ['src/**/*.coffee']
        tasks: ['coffee:product']
      jade:
        files: ['src/**/*.jade']
        tasks: ['jade:product']
      stylus:
        files: ['src/**/*.styl']
        tasks: ['stylus:product']
    alyssum:
      bin: '~/tmp/atom-shell/out/Debug/atom'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'jade', 'stylus']
  grunt.registerTask 'run', 'run alyssum', ->
    exec = require('child_process').exec
    command = grunt.config('alyssum.bin')+' ./'

    exec(command)

