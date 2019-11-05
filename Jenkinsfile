pipeline {
  agent any
  stages {
    stage('') {
      steps {
        git(url: 'https://github.com/kpeiruza/docker-hashtopolis-server/', branch: 'master')
        echo 'Hola Caracola'
        sh '''cat /etc/os-release
echo "test 2"
'''
      }
    }

  }
}