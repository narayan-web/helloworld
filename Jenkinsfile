pipeline {
    agent any
    tools {
        maven 'maven'        // maven is configured as under global tool configuration 
        jdk 'java'          //  java is configured as jdk under global tool configuration 
    }
    environment{
        PATH = "/opt/maven/apache-maven-3.8.7/bin:$PATH"   // check in jenkins system
		HOME = "${env.WORKSPACE}"                  // check in jenkins system
    }

    stages {
        stage('Git checkout') {
            steps {
                git 'https://github.com/narayan-web/helloworld.git'
                  }
        }
        stage("Maven Build "){
            steps{
                  sh "mvn -f  ${HOME}/pom.xml clean install package"
            }
        }
         stage("create vm"){
             steps{
                  sh "sh /opt/createvm.sh"
           }
        }
       
         stage("deploy war"){
             steps{
                 deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://104.40.243.116:8080/')], contextPath: null, onFailure: false, war: '**/*war'
       }
      }
    }
}
