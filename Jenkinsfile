pipeline {
    agent any

    environment {
    
        PASS = credentials('DockerHub') 
    }

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
                script {
                    sh ' echo "Docker Login" '
                    sh ' docker login -u edgarestebanramirez -p $PASS'
                    sh ' echo "Docker Push" '
                    sh ' docker tag minecraft:$BUILD_NUMBER edgarestebanramirez/jenkinstesting'
                    sh ' docker push edgarestebanramirez/jenkinstesting'
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
