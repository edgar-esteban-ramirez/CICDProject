pipeline {
    agent any

    environment {
    
        PASS = credentials('DockerHub') 
    }

    stages {
        stage('Pre-Build') {
            steps {
                script{
                    sh '''
                    echo "Docker Login"
                    docker login -u edgarestebanramirez -p $PASS '''
                }
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
                    sh ''' 
                    echo "Docker Tag"
                    docker tag minecraft:$BUILD_NUMBER edgarestebanramirez/jenkinstesting
                    echo "Docker Push"
                    docker push edgarestebanramirez/jenkinstesting'''
                }
            }
        }
        stage('Push-Deploy') {
            steps {
                echo 'Deploying.....'
                script {
                    sh ''' 
                    echo "Docker Pull"
                    ssh root@DeployServer ' docker pull edgarestebanramirez/jenkinstesting:latest '
                    echo "Docker run"
                    ssh root@DeployServer ' docker run -d -p 25565:25565 --name minecraftjenkins edgarestebanramirez/jenkinstesting:latest '''
                }
            }
        }
    }
}
