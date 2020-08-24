@Library('cloudmc-jenkins-shared@master') _ 

pipeline {
  agent { label 'cmc' }
  options { disableConcurrentBuilds() }

  environment {
    GIT_URL = 'git@github.com:cloudops/cloudmc-api-docs.git'
  }

  stages {
    stage('Deploy github pages') {
      when {
        expression {
          env.BRANCH_NAME == 'cmc-dev'
        }
      }
      steps{
        script {
            sh "sudo bundle install"
            withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'gh-jenkins', usernameVariable: 'GIT_AUTHOR_NAME', passwordVariable: 'GIT_PASSWORD']]) {
                sh 'set +x'
                sh 'git config user.name "$GIT_AUTHOR_NAME"'
                sh 'git config user.password "$GIT_PASSWORD"'
                sh 'set -x'
                sh "./deploy.sh"
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

