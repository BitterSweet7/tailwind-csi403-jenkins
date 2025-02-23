pipeline {
    agent any

    stages {
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
