pipeline {
  agent any


  stages {
    stage('Setup') {
      steps {
        echo "Setup"
        sh "flutter build apk --release"
      }
    }
    stage('Build') {
      steps {
        echo "Building"
        // Ensure bundler is available in PATH
        //sh "bundle exec fastlane android build"
      }
    }
  }
}