pipeline {
  agent any

  stages {
    stage('Setup') {
      steps {
        echo "Setup"
        flutter --version

        // Ensure gems installed properly
        //sh "bundle check || bundle install --jobs=4 --retry=3"
      }
    }
    stage('Build') {
      steps {
        echo "Building"
        // Ensure bundler is available in PATH
        sh "bundle exec fastlane android build"
      }
    }
  }
}