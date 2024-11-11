pipeline {
    agent any
    environment {
        IMAGE_NAME = "mommakara026/nextjs-test"
        CONTAINER_NAME = "nextjs-app"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Makara1122/jenkin-next', branch: 'main'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove any existing container with the same name
                    sh 'docker rm -f ${CONTAINER_NAME} || true'
                    
                    // Run the new container
                    docker.image("${IMAGE_NAME}:latest").run("--name ${CONTAINER_NAME} -p 3000:3000")
                }
            }
        }
    }
    post {
        always {
            echo 'Cleaning up workspace...'
            cleanWs()
        }
        success {
            echo 'Deployment succeeded!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
