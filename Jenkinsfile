pipeline {
    agent any

    stages {

        stage('Deploy') {
            steps {
                sh """
                ssh root@192.168.56.2 '
                if [ ! -d /opt/moodle/.git ]; then
                    rm -rf /opt/moodle
                    git clone https://github.com/fikribahtiar/auto-deploy-moodle.git /opt/moodle
                else
                    cd /opt/moodle
                    git pull origin main
                fi

                cd /opt/moodle

                docker compose down
                docker compose build
                docker compose up -d
                '
                """
            }
        }

    }
}