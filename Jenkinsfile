pipeline {
    agent any
    
    stages {
        stage("clone code") {
            steps {
                script {
                    // Let's clone the source
                    git 'https://github.com/Ramanjulur/docker-jenkins_updated.git';
                }
            }
        }
        stage("Build & UnitTest") {
            steps {
                script {
                    // If you are using Windows then you should use "bat" step
                    sh "docker build -t demoapp:B${BUILD_NUMBER} Dockerfile"
                    sh "docker build -t demoapp:test-B${BUILD_NUMBER} -f Dockerfile.Integration"
                }
            }
        }
        stage('Integration Test') {
            steps {
                sh "docker-compose -f docker-compose.integration.yml up --force-recreate --abort-on-container-exit"
                sh "docker-compose -f docker-compose.integration.yml down -v"
            }
            
        }
                    } 
                }
            
