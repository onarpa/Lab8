pipeline {
    agent any   

    stages {
        stage('Check Environment') {
            steps {
                echo 'Hello Jenkins!'
                sh 'whoami'
                sh 'pwd'
            }
        }

        stage('List Files') {
            steps {
                sh 'ls -la'
            }
        }

        stage('Run Custom Command') {
            steps {
                sh 'echo "Pipeline is running successfully"'
            }
        }
    }
}