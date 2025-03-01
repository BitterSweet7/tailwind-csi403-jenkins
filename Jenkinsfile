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
                        bat "docker build -t my-tailwind-project ."
                        print "Docker build image success"
                }
                print "Docker build image running to container"
                script {
                    bat 'docker rm -f build my-tailwind-project || true'
                    bat 'docker run -d --name my-tailwind-project -p 52700:80 my-tailwind-project:latest'
                    print "Docker build image running to container success"
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
