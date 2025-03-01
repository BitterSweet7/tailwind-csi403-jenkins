pipeline {
    agent any  // This will run on any available agent, including your MacBook
    environment {
        LOCAL_REGISTRY = 'localhost:5000'
    }
    stages {
        stage('Checkout') {
            steps {
                echo "Checkout"
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo "Docker build image"
                sh 'docker build -t my-tailwind-project .'
                echo "Docker build image success"
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
            }
        }
    }
}
