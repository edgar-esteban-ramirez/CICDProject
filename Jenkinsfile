// pipeline {
//     agent any

//     environment {
    
//         PASS = credentials('DockerHub') 
//     }

//     stages {
//         stage('Pre-Build') {
//             steps {
//                 echo 'Pre-Build Stage'
//             }
//         }
//         stage('Build') {
//             steps{
//                 echo  "Building Image"
//                 script{
//                     docker.build("minecraft:${env.BUILD_NUMBER}")
//                 }
                
//             }         
//         }
//         stage('Test') {
//             steps {
//                 script {
//                     sh ' echo "Docker Login" '
//                     sh ' docker login -u edgarestebanramirez -p $PASS'
//                     sh ' echo "Docker Push" '
//                     sh ' docker tag minecraft:$BUILD_TAG edgarestebanramirez/jenkinstesting'
//                 }
//             }
//         }
//         stage('Push-Deploy') {
//             steps {
//                 echo 'Deploying....'
//             }
//         }
//     }
// }
pipeline {
    agent any

    environment {
        secret = credentials('DockerHub')
    }
    stages {
        stage('Example stage 1') {
            steps {
                sh 'echo $secret'
            }
        }
    }
}