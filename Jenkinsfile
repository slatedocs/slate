library(identifier: 'utils@v2.4.5', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'git@github.com:cloudops/cloudmc-jenkins-shared.git',
   credentialsId: 'gh-jenkins']))

pipeline {
  agent { label 'cmc' }
  options { disableConcurrentBuilds() }

  environment {
    GIT_URL = 'git@github.com:cloudops/cloudmc-api-docs.git'
  }

  stages {
    stage('Setup') {
      steps {
        deleteDir()
        git credentialsId: 'gh-jenkins', url: env.GIT_URL, branch: env.BRANCH_NAME
      }
    }

    stage('Deploy github pages') {
      when {
        expression {
          env.BRANCH_NAME == 'cmc-dev'
        }
      }
      steps{
        script {
            sh "sudo bundle install"
            sshagent (credentials: ['gh-jenkins']) {
                sh "sudo ./deploy.sh"
            }
        }
      }
    }
  }
  post{
    always {
      notifySlack currentBuild.result
    }
  }
}

