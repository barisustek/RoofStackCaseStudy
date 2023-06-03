pipeline {
    agent any
    tools {
      maven 'Maven-3.9.2'
      jdk 'JDK17'
    }
    stages {
        stage('Build') {
            steps {
                 checkout scm
            }
        }

        stage('Checkout') {
                    steps {
                         sh 'mvn build'
                    }
                }

        stage('Run Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Publish Reports') {
            steps {
                archiveArtifacts artifacts: 'target/cucumber-reports/**/*.*', fingerprint: true

                cucumber 'target/cucumber-reports'
            }
        }
    }
}