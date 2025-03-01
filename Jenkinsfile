pipeline {
    agent any
    environment{
        LOCAL_REGISTRY = 'localhost:5000'
    }

    stages {
        stage('Checkout') {
            steps {
                print "Checkout "
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
                print "Docker build image"
                script {
                    sh 'docker pull --disable-content-trust=false node:16-alpine'
                        sh 'DOCKER_BUILTKIT=0 docker build -t my-tailwind-project .'
                }
                print "Docker build image running to container"
                script {
                    sh 'docker rm -f build my-tailwind-project || true'
                    sh 'docker run -d --name my-tailwind-project -p 52700:80 my-tailwind-project:latest'
                }
            }

        }
        stage('Test') {
            steps {
                script {
                    print'Running tests...'
                }
            }
        }
    }
}
