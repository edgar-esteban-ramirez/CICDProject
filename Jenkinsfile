pipeline {
    agent any

    stages {
        stage('Pre-Build') {
            steps {
                echo 'Pre-Build Stage'
            }
        }
        stage('Build') {
            steps{
                echo  "Building Image"
                script{
                    docker.build("minecraft:${env.BUILD_NUMBER}")
                }
                
            }         
        }
        stage('Test') {
            steps {
                echo 'Scanning the Image'
                script {
                    docker.logs("minecraft:${env.BUILD_NUMBER}")
            }
        }
        stage('Push-Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}