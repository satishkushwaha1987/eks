pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    environment {
    AWS_ACCOUNT_ID="637423367548"
    AWS_DEFAULT_REGION="us-east-1"
    IMAGE_REPO_NAME="octopus-underwater-app"
    IMAGE_TAG="latest"
    REPOSITORY_URI = "637423367548.dkr.ecr.us-east-1.amazonaws.com/octopus-underwater-app"
  }
    stages {
         stage('Clone repository') { 
            steps { 
                git url: 'https://github.com/satishkushwaha1987/eks.git', branch: 'main'
                }
        }
        
        stage('Build') { 
            steps { 
                    sh 'docker build -t docker-2048:latest .'
                }
            }
        stage('Test'){
            steps {
                 echo 'Empty'
            }
        }
        stage('Push') {
            steps {
                script{
                        docker.withRegistry('https://637423367548.dkr.ecr.us-east-1.amazonaws.com/octopus-underwater-app', 'ecr:us-east-1:aws-credentials') {
                            sh "docker tag ${IMAGE_REPO_NAME}:${IMAGE_TAG} ${REPOSITORY_URI}:$IMAGE_TAG"
                            sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:${IMAGE_TAG}"
                    }
                }
            }
        }
        // stage('Deploy'){
        //     steps {
        //         sh 'kubectl apply -f deployment.yml'
        //     }
        // }
    }

}

