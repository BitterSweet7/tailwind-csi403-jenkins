pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building project...'
                    sh 'npm run build'
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
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying project...'
                    sh 'docker build -t my-tailwind-frontend .'
                    sh 'docker run -p 8080:80 my-tailwind-frontend'
                }
            }
        }
    }
}
