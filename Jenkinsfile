pipeline {
    agent any

    stages {
        stage('Dasg') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        credentialsId: '',
                        url: 'https://github.com/BitterSweet7/tailwind-csi403-jenkins.git'
                    ]]
                ])
            }
            print "Checkout success"
        }
        stage('Build') {
            steps {
                script {
                    echo 'Building project...'
                    sh '/usr/local/bin/docker build -t csi403-image .'
                    sh '/usr/local/bin/docker run --name csi403-image-run -p 54100:3000 csi403-image'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    sh 'npm test'
                }
            }
        }
    }
}
