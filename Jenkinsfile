pipeline {
  environment {
    registry = "ramanjulur/myrepo"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('push Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
	stage("Deploy to staging") {
     steps {
          echo 'running image'
          //sh "docker run -d --rm -p 8082:8080 --name mycontainer$BUILD_NUMBER ramanjulur/myrepo:$BUILD_NUMBER"
     }
  }
  
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }
}
