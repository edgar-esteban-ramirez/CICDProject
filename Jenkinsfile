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
                    sh ''' 
                    echo "Docker Login"
                    docker login -u edgarestebanramirez -p $PASS
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
                    ssh root@DeployServer ' docker pull edgarestebanramirez/jenkinstesting:latest '
                    ssh root@DeployServer ' docker run -p 25565:25565 --name minecraftjenkins edgarestebanramirez/jenkinstesting:latest '
                    ./DeployScripts/Deploy.sh '''
                }
            }
        }
    }
}
