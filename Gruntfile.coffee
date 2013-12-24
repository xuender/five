module.exports = (grunt)->
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-karma'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-bumpx'
  grunt.loadNpmTasks 'grunt-manifest'
  grunt.loadNpmTasks 'grunt-gh-pages'
  grunt.loadNpmTasks 'grunt-ftp-deploy'

  grunt.initConfig(
    pkg:
      grunt.file.readJSON('package.json')
    clean:
      dist: ['dist']
    bump:
      options:
        part: 'patch'
      files: [ 'package.json' ]
    copy:
      root:
        files: [
          cwd: 'src/'
          src: [
            '.gitignore'
          ]
          dest: 'dist/'
          expand: true
          filter: 'isFile'
        ]
      highcharts:
        files: [
          cwd: 'bower_components/highcharts/'
          src: [
            'highcharts.js'
            'highcharts-more.js'
          ]
          dest: 'dist/js/'
          expand: true
          filter: 'isFile'
        ]
      html5:
        files: [
          cwd: 'bower_components/html5shiv/dist/'
          src: [
            'html5shiv.js'
          ]
          dest: 'dist/js/'
          expand: true
          filter: 'isFile'
        ]
      angular:
        files: [
          cwd: 'bower_components/angular/'
          src: [
            'angular.min.js'
            'angular.min.js.map'
          ]
          dest: 'dist/js/'
          expand: true
          filter: 'isFile'
        ]
      angularCss:
        files: [
          cwd: 'bower_components/angular/'
          src: [
            'angular-csp.css'
          ]
          dest: 'dist/css/'
          expand: true
          filter: 'isFile'
        ]
      jquery:
        files: [
          cwd: 'bower_components/jquery/'
          src: [
            'jquery.min.js'
            'jquery.min.map'
          ]
          dest: 'dist/js/'
          expand: true
          filter: 'isFile'
        ]
      font:
        # font-awesome
        files: [
          cwd: 'bower_components/font-awesome/'
          src: [
            'css/font-awesome.min.css'
            'fonts/fontawesome-webfont.eot'
            'fonts/fontawesome-webfont.svg'
            'fonts/fontawesome-webfont.ttf'
            'fonts/fontawesome-webfont.woff'
          ]
          dest: 'dist'
          expand: true
          filter: 'isFile'
        ]
      bootstrap:
        # bootstrap 2.3.2
        files: [
          cwd: 'bower_components/bootstrap/bootstrap/'
          src: [
            'css/bootstrap.min.css'
            'js/bootstrap.min.js'
          ]
          dest: 'dist'
          expand: true
          filter: 'isFile'
        ]
    coffee:
      options:
        bare: true
      index:
        files:
          'dist/js/index.min.js': [
            'src/analytics.coffee'
            'src/data.coffee'
            'src/index.coffee'
          ]
    uglify:
      json2:
        files:
          'dist/js/json2.min.js': [
            'bower_components/json2/json2.js'
          ]
      index:
        files:
          'dist/js/index.min.js': [
            'dist/js/index.min.js'
          ]
    htmlmin:
      dist:
        options:
          removeComments: true,
          collapseWhitespace: true
        files:
          'dist/index.html': 'src/index.html'
    cssmin:
      index:
        expand: true
        cwd: 'src'
        src: ['*.css', '!*.min.css'],
        dest: 'dist/css/',
        ext: '.min.css'
    manifest:
      options:
        basePath: 'dist/'
        network: [
          'http://www.google-analytics.com/*'
          'https://www.google-analytics.com/*'
        ]
      index:
        src: [
          'index.html'
          'js/*.js'
          'js/*.map'
          'fonts/*'
          'css/*.css'
        ]
        dest: 'dist/manifest.appcache'
    'gh-pages':
      options:
        base: 'dist'
      src: [
        '.gitignore'
        '**/*'
      ]
    'ftp-deploy':
      dist:
        auth:
          host: '112.125.150.94'
          port: 21
          authKey: 'key1'
        src: 'dist'
        dest: '/five'
    watch:
      html:
        files: [
          'src/*.html'
        ]
        tasks: ['htmlmin', 'manifest']
      css:
        files: [
          'src/*.css'
        ]
        tasks: ['cssmin', 'manifest']
      coffee:
        files: [
          'src/*.coffee'
        ]
        tasks: ['coffee', 'manifest']
    karma:
      options:
        configFile: 'karma.conf.js'
      dev:
        colors: true,
      travis:
        singleRun: true
        autoWatch: false
  )
  grunt.registerTask('test', '测试', ['karma'])
  grunt.registerTask('dev', '开发数据', [
    'clean'
    'copy',
    'htmlmin'
    'cssmin'
    'coffee'
    'manifest'
  ])
  grunt.registerTask('dist', '打包', [
    'dev'
    'uglify'
    'ftp-deploy'
  ])
  grunt.registerTask('deploy', '发布', [
    'dist'
    'bump'
    'gh-pages'
  ])
  grunt.registerTask('default', '默认(打包)', ['dist'])
