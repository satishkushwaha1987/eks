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
                stage("Build") {
                    sh 'docker build . -t sushantkapare1717/node-todo-list:latest'
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

