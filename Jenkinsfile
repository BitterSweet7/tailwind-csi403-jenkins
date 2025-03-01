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

        stage('Build Docker Image') {
            steps {
                echo "Building Docker image"
                script {
                    // Build the Docker image
                    sh 'docker build --no-cache -t my-tailwind-project .'
                    echo "Docker build image success"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker container"
                script {
                    // Run the container from the built image
                    sh 'docker run -d --name my-tailwind-project -p 52700:80 my-tailwind-project'
                    echo "Docker container running"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // Insert your test commands here if needed
                }
            }
        }
    }
}
