pipeline {
    agent any
    environment {
        LOCAL_REGISTRY = 'localhost:5000'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checkout"
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        credentialsId: '7b8a8548-fec8-4a17-9334-1c84556d634b', // Replace with actual credentialsId
                        url: 'https://github.com/BitterSweet7/tailwind-csi403-jenkins.git'
                    ]]
                ])
                echo "Checkout success"
            }
        }

        stage('Build') {
            steps {
                echo "Docker build image"
                script {
                    sh "docker build --no-cache -t my-tailwind-project ."
                    echo "Docker build image success"
                }
                echo "Docker build image running to container"
                script {
                    sh 'docker rm -f my-tailwind-project || true'
                    sh 'docker run -d --name my-tailwind-project -p 52700:80 my-tailwind-project:latest'
                    echo "Docker build image running to container success"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                }
            }
        }
    }
}
