pipeline {
  agent any
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/alexo-bunnyshell/eaas-demonstrator', branch: 'main', changelog: true)
      }
    }

  }
}