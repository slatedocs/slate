@Library('deployment') _
import org.mapcreator.Deploy

node('node') {
	stage('checkout') {
		checkout scm
	}

	stage('build') {
		sh 'wget https://api.beta.maps4news.com/docs/assets/api-docs.json'
		sh 'widdershins api-docs.json -o source/api.html.md'
		sh 'rm api-docs.json'
		sh 'bundle exec middleman build --clean'
	}

	stage('deploy') {
		def deploy = new DeployArt(steps)
		deploy.initialize(
            '/var/www/',
            'maps4news-docs',
            'master',
            BUILD_NUMBER,
            'f206c873-8c0b-481e-9c72-1ecb97a5213a',
            'deploy',
            '54.246.191.92',
            true
        )

        deploy.prepare()
        deploy.copy('./build/*')
        deploy.finish()
	}

	stage('cleanup') {
		step([$class: 'WsCleanup'])
	}
}