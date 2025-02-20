pipeline {
  agent any
  stages {
    stage('Setup') {
      steps {
        echo "Setup"
        // Install bundler in the user's home directory
        sh "gem install --user-install bundler"
        // Configure bundler to use the user's home directory
        sh "bundle config set --local path '~/.bundle'"
        // Ensure gems installed properly
        sh "bundle check || bundle install --jobs=4 --retry=3"
      }
    }
    stage('Build') {
      steps {
        echo "Building"
        // Ensure bundler is available in PATH
        sh "export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH"
        sh "bundle exec fastlane android build"
      }
    }
  }
}