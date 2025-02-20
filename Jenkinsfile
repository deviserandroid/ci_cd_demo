pipeline {
  agent any
  environment {
      GEM_HOME = "$HOME/.gem/ruby/3.1.3"
      PATH = "$HOME/.gem/ruby/3.1.3/bin:$PATH"
    }
  stages {
    stage('Setup') {
      steps {
        echo "Setup"
        // Configure bundler to use the user's home directory
        sh "bundle config set --local path 'vendor/bundle'"
        // Install bundler in the user's home directory
        sh "gem install --user-install bundler -v 2.4.22"
        // Ensure gems installed properly
        sh "bundle check || bundle install --jobs=4 --retry=3"
      }
    }
    stage('Build') {
      steps {
        echo "Building"
        // Ensure bundler is available in PATH
        sh "export PATH=$HOME/.gem/ruby/3.1.3/bin:$PATH"
        sh "bundle exec fastlane android build"
      }
    }
  }
}