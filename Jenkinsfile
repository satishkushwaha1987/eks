pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    environment {
    AWS_ACCOUNT_ID="637423367548"
    AWS_DEFAULT_REGION="us-east-1"
    IMAGE_REPO_NAME="octopus-underwater-app"
    IMAGE_TAG="v1"
    REPOSITORY_URI = "637423367548.dkr.ecr.us-east-1.amazonaws.com/octopus-underwater-app"
  }
    stages {
         stage('Clone repository') { 
            steps { 
                script{
                checkout scm
                }
            }
        }
        stage('Build') { 
            steps { 
                script{
                 app = docker.build("octopus-underwater-app")
                }
            }
        }
        stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        //       stage('Logging into AWS ECR') {
        //     steps {
        //         script {
        //          //   sh """docker login -u satish -p ${aws ecr get-login-password --region us-east-1} 637423367548.dkr.ecr.us-east-1.amazonaws.com"""
        //          sh """aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username satish --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"""
        //         }
                 
        //     }
        // }
        stage('Push') {
            steps {
                script{
                    // sh """docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"""
                    // sh """docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"""
                        docker.withRegistry('https://637423367548.dkr.ecr.us-east-1.amazonaws.com/octopus-underwater-app', 'ecr:us-east-1:aws-credentials') {
                    app.push("${env.BUILD_NUMBER}")
                    app.push("latest")
                    }
                }
            }
        }
        stage('Deploy'){
            steps {
                 sh 'kubectl apply -f deployment.yml'
            }
        }

    }
}
