pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git 'https://github.com/fikribahtiar/auto-deploy-moodle.git'
            }
        }

        stage('Deploy to Server') {
            steps {
                sh """
                ssh user@192.168.56.2 '
                bash -s' < deploy.sh
                """
            }
        }

    }
}