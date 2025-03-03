// script used for a Jenkinsfile is written in a Groovy-based Domain-Specific Language (DSL)
pipeline {
  agent any

  stages {
    stage('Setup') {
      steps {
        echo "Setup"
        // Configure bundler to use the user's home directory
        sh "bundle config set --local path 'vendor/bundle'"
        // Install bundler in the user's home directory
        sh "gem install --user-install bundler"
        sh "gem install --user-install bundler fastlane"
        sh "gem install --user-install bundler cocoapods"
        // Ensure gems installed properly
        sh "bundle check || bundle install --jobs=4 --retry=3"
      }
    }
    stage('Build Android') {
      steps {
        echo "Executing Fastlane: 'release' for Android"
        // Ensure bundler is available in PATH
        dir("android") {
           sh 'echo "Current directory: $(pwd)"'
           sh "bundle exec fastlane android release"
        }
      }
    }

    stage('Build iOS') {
      steps {
        echo "Executing Fastlane: 'release' for iOS"
        sh 'echo "Current directory: $(pwd)"'

        // Ensure bundler is available in PATH
        dir("ios") {
           sh 'echo "Current directory: $(pwd)"'
           sh "bundle exec fastlane ios release"
        }
      }
    }
  }
}