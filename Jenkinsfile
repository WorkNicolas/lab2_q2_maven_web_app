pipeline {
    agent any

    environment {
        DOCKER_IMAGE           = "chlora/lab3-webapp"
        DOCKER_TAG             = "latest"
        DOCKERHUB_CREDENTIALS  = credentials('dockerhub-credentials')
    }

    stages {

        // Stage 4a: Checkout
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/WorkNicolas/lab2_q2_maven_web_app.git'
                echo 'Source code checked out successfully.'
            }
        }

        // Stage 4b: Build Maven Project
        stage('Build Maven Project') {
            steps {
                bat 'mvn clean package -DskipTests'
                echo 'Maven build completed. WAR: target/lab2_q2_maven_web_app.war'
            }
        }

        // Stage 4d: Docker Login
        stage('Docker Login') {
            steps {
                bat 'echo %DOCKERHUB_CREDENTIALS_PSW% | docker login -u %DOCKERHUB_CREDENTIALS_USR% --password-stdin'
                echo 'Docker login successful.'
            }
        }

        // Stage 4e: Docker Build
        stage('Docker Build') {
            steps {
                bat "docker build -t %DOCKER_IMAGE%:%DOCKER_TAG% ."
                echo 'Docker image built successfully.'
            }
        }

        // Stage 4f: Docker Push
        stage('Docker Push') {
            steps {
                bat "docker push %DOCKER_IMAGE%:%DOCKER_TAG%"
                echo 'Docker image pushed to Docker Hub.'
            }
        }
    }

    post {
        always {
            bat 'docker logout'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the console output above.'
        }
    }
}
