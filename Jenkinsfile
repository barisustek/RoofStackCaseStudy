pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code from version control
                // Replace the URL with your repository URL and set appropriate credentials if needed
                checkout scm
            }
        }

        stage('Build') {
            steps {
                // Run Maven to build the project
                sh 'mvn clean compile'
            }
        }

        stage('Run Tests') {
            steps {
                // Run Cucumber tests using Maven
                sh 'mvn test'
            }
        }

        stage('Publish Reports') {
            steps {
                // Archive test reports and any other relevant artifacts
                archiveArtifacts artifacts: 'target/cucumber-reports/**/*.*', fingerprint: true

                // Publish the test reports
                cucumber 'target/cucumber-reports'
            }
        }
    }
}