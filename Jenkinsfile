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
                docker.build("edgar-esteban-ramirez/CICDProject:${env.BUILD_NUMBER}")
            }         
        }
        stage('Test') {
            steps {
                echo 'Scanning the Image'
                docker.scan("edgar-esteban-ramirez/CICDProject:${env.BUILD_NUMBER}")
            }
        }
        stage('Push-Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}