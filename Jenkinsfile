node {
    stage 'Init'
    stage 'Checkout'
    checkout scm
    stage 'Build'
    def csioapidoc = docker.build 'csioapidoc:snapshot'
    dashboard.inside {
        sh 'sleep 10'
        sh 'middleman build'
    }
}
