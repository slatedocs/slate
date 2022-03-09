import groovy.json.JsonSlurperClassic
import groovy.json.JsonOutput

library(identifier: 'utils@v2.4.5', retriever: modernSCM(
  [$class: 'GitSCMSource',
   remote: 'git@github.com:cloudops/cloudmc-jenkins-shared.git',
   credentialsId: 'gh-jenkins']))

pipeline {
  agent { label 'api-docs' }
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
    stage('Update ESCROW info') {
      when {
        expression {
          env.BRANCH_NAME == 'cmc-dev'
        }
      }
      steps {
        script {
          if (fileExists('deposit_information.json')) {
            def json = readFile(file:'deposit_information.json')
            def data = new JsonSlurperClassic().parseText(json)
            def currentVersion = data.DepositVersion;

            def versionParts = currentVersion.split('\\.')
            assert versionParts.size() == 3: "Helm chart version ${currentVersion} isn't of the form X.X.X!"
            versionParts[2] = versionParts[2].toInteger() + 1;

            def newVersion = versionParts.join('.')

            echo "updating deposit information file version from ${currentVersion} to ${newVersion}"
            def newJson = json.replaceFirst("\"${currentVersion}\"", "\"${newVersion}\"")
            writeFile(file:'deposit_information.json', text: newJson)
            commit "Bumped version to ${newVersion}"
            sh "git push origin cmc-dev"
          }
        }
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

