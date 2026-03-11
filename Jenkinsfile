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

                echo "Pull images..."
                docker pull postgres:15
                docker pull bitnami/moodle

                echo "Start containers..."
                docker compose up -d
                '
                """
            }
        }

    }
}