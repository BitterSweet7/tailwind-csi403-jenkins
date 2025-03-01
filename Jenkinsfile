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
                        credentialsId: 'your-credentials-id', // Replace with actual credentialsId
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
                    bat "docker build --no-cache -t my-tailwind-project ."
                    echo "Docker build image success"
                }
                echo "Docker build image running to container"
                script {
                    bat 'docker rm -f my-tailwind-project || true'
                    bat 'docker run -d --name my-tailwind-project -p 52700:80 my-tailwind-project:latest'
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
