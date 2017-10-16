module.exports = function(grunt) {

  grunt.initConfig({

    htmlmin: {
      options: {
        removeComments: true,
        collapseWhitespace: true
      },
      dist: {
        files: [{
          'expand': true,
          'src': 'build/*.html',
          'dest': 'dist',
          'flatten': true
        }]
      }
    },

    jshint: {
      options: {
            reporter: require('jshint-stylish')
        },
      all: ['components/**/*.js', '!components/**/*.test.js']
    },

    karma: {
      unit: {
        configFile: 'karma.conf.js'
      }
    },

    uglify: {
      build: {
        options: {
          'beautify': true,
          'mangle': false,
          'compress': false
        },
         files: {
          'build/js/main.js': ['components/**/*.js', '!components/**/*.test.js']
        }
      },
      dist: {
        files: {
          'dist/js/main.min.js': ['build/js/main.js']
        }
      }
    },

    csslint : {
      strict : {
        options : {
          import: false,
          important: true,
        },
        src : ['assets/main.css']
      },
    },

    postcss: {
      options: {
        processors: [
          require('autoprefixer')({browsers: ['> 1%']}),
        ]
      },
      dist: {
        src: 'assets/main.css'
      }
    },

    cssmin: {
      options: {
        shorthandCompacting: false,
        roundingPrecision: -1
      },
      dist: {
        files: {
          'dist/css/main.min.css': ['build/css/main.css']
        }
      }
    },

    copy: {
     json_build: {
        expand: true,
        src: 'data/*',
        dest: 'build/',
      },
      json_dist: {
        expand: true,
        src: 'build/data/*',
        dest: 'dist/data/',
        flatten: true
      },
      html: {
        'expand': true,
        'cwd': 'components',
        'src': '**/*.html',
        'dest': 'build',
        'flatten': true
      }
    },

    concat: {
      options: {
        separator: '\n',
      },
      dist: {
        src: ['node_modules/foundation-sites/dist/foundation.css', 'assets/main.css'],
        dest: 'build/css/main.css',
      },
    },

    replace: {
      dist: {
        src: ['dist/index.html'],
        overwrite: true,
        replacements: [
          {
            from: /angular\.js/g,
            to: "angular.min.js"
          },
          {
            from: /angular-route\.js/g,
            to: "angular-route.min.js"
          },
          {
            from: /main\.css/,
            to: "main.min.css"
          },
          {
            from: /main\.js/,
            to: "main.min.js"
          }
        ]
      }
    }

  });

  /* Load tasks */
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-csslint');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-karma');
  grunt.loadNpmTasks('grunt-postcss');
  grunt.loadNpmTasks('grunt-text-replace');


  /* Linters */
  grunt.registerTask('lint:js', ['jshint']);
  grunt.registerTask('lint:css', ['csslint']);
  grunt.registerTask('lint', function(){
    grunt.task.run('lint:js', 'lint:css');
  });

  /* Testing */
  grunt.registerTask('test', ['karma']);

  /* Build
     The build folder contains built files, non-minified.
  */
  grunt.registerTask('build:html', 'copy:html');
  grunt.registerTask('build:css', function(){
    grunt.task.run('lint:css', 'postcss', 'concat');
  });
  grunt.registerTask('build:js', function(){
    grunt.task.run('lint:js', 'uglify:build');
  });
  grunt.registerTask('build:json', 'copy:json_build');
  grunt.registerTask('build', function(){
    grunt.task.run('build:html','build:css', 'build:js');
  });

  /* Dist
     The dist folder contains compressed and minified files, ready for deployment.
  */
  grunt.registerTask('dist:html', function(){
    grunt.task.run('build:html', 'htmlmin', 'replace');
  });
  grunt.registerTask('dist:css', function(){
    grunt.task.run('build:css', 'cssmin');
  });
  grunt.registerTask('dist:js', function(){
    grunt.task.run('build:js', 'test', 'uglify:dist');
  });
  grunt.registerTask('dist:json', function(){
    grunt.task.run('build:json', 'copy:json_dist');
  });
  grunt.registerTask('dist', function(){
    grunt.task.run('dist:html', 'dist:css', 'dist:js', 'dist:json');
  });

  /* Default task
     The default task is the dist task
  */
  grunt.registerTask('default', function(){
    grunt.task.run('dist');
  });

};
