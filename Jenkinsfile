pipeline {
  agent any

  stages {
  stage('GIT PULL') {
              steps {
                  git branch: "cicd", url: 'https://github.com/deviserandroid/ci_cd_demo.git'
              }
          }
          stage('TEST') {
              steps {
                  sh 'flutter test'
              }
          }
          stage('BUILD') {
              steps {
                  sh '''
                    #!/bin/sh
                    flutter build apk --debug
                    '''
              }
          }

//     stage('Setup') {
//       steps {
//         echo "Setup"
//         sh "export PATH=$HOME/.gem/ruby/3.1.3/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH"
//         // Configure bundler to use the user's home directory
//         sh "bundle config set --local path 'vendor/bundle'"
//         // Install bundler in the user's home directory
//
//         sh "chown -R zimble2020 ~/Library/Ruby"
//         sh "gem install bundler"
//         // Ensure gems installed properly
//         sh "bundle check || bundle install --jobs=4 --retry=3"
//       }
//     }
//     stage('Build') {
//       steps {
//         echo "Building"
//         // Ensure bundler is available in PATH
//         sh "bundle exec fastlane android build"
//       }
//     }
  }
}