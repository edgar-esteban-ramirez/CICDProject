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
                    sh ' docker run -it --rm --name Testing minecraft:$(env.BUILD_NUMBER) curl localhost:25565 '
                }
            }
        }
        stage('Push-Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}