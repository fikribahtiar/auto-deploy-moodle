pipeline {
    agent any

    stages {

        stage('Deploy') {
            steps {
                sh """
                ssh root@192.168.56.2 '
                cd /opt/moodle || exit
                git pull origin main || git clone https://github.com/fikribahtiar/auto-deploy-moodle.git /opt/moodle
                cd /opt/moodle
                docker compose up -d
                '
                """
            }
        }

    }
}