node{
    stage('Scm Checkout'){
    git credentialsId: 'git', url: 'https://github.com/kishanpeddaboina/Docker'
}
    stage('Mvn Package'){
    def mvnHome = tool name: 'maven', type: 'maven'
def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
}
     stage('Build Docker'){
     sh 'docker build -t kishanpeddaboina/my-app:${BUILD_NUMBER} .'
}
    stage('Push Docker Image'){
    withCredentials([string(credentialsId: 'hubpassword', variable: 'hubpassword')]) {
     sh "docker login -u kishanpeddaboina -p ${hubpasswd}"
}
     sh 'docker push kishanpeddaboina/my-app:${BUILD_NUMBER}'
  

}

stage('Remove Old Containers'){
    sshagent(['dev-staging']) {
      try{
        def sshCmd = 'ssh -o StrictHostKeyChecking=no ubuntu@54.191.73.116'
        def dockerRM = 'docker rm -f my-kishan'
        sh "${sshCmd} ${dockerRM}"
      }catch(error){

      }
    }
  }

   stage('Runcontainer on dev server'){

  def dockerRun = 'docker run -p 8080:8080 -d --name my-kishan kishanpeddaboina/my-app:${BUILD_NUMBER}'
  sshagent(['dev-staging']) {
 sh "ssh -o StrictHostKeyChecking=no ubuntu@54.191.73.116 ${dockerRun}"
}

}


}


