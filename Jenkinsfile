pipeline {
    agent any

    stages {

        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/fikribahtiar/auto-deploy-moodle.git'
            }
        }

        stage('Deploy to Server') {
            steps {
                sh """
                ssh root@192.168.56.2 'bash -s' < deploy.sh
                """
            }
        }

    }
}