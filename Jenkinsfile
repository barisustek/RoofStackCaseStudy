pipeline {
    agent any
    tools {
      maven 'Maven-3.9.2'
      jdk 'JDK17'
    }

    stages {
            stage('Checkout') {
                steps {
                    checkout scm
                }
            }

            stage('Build') {
                steps {
                    sh 'mvn clean compile'
                }
            }

            stage('Run Tests') {
                steps {
                    sh 'mvn test'
                }
            }

            stage('Publish Reports') {
                steps {
                    archiveArtifacts artifacts: 'target/cucumber-report/*.*', fingerprint: true
                    cucumber 'target/cucumber-report'
                }
            }
        }
}