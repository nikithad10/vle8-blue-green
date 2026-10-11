pipeline {
    agent any

    stages {

        stage('Debug Docker') {
            steps {
                sh '''
                    echo "PATH=$PATH"
                    ls -l /usr/bin/docker
                    /usr/bin/docker --version
                    docker --version
                '''
            }
        }

        stage('Build') {
            steps {
                sh '/usr/bin/docker build -t myapp:v2 ./app'
            }
        }

        stage('Deploy Green') {
            steps {
                sh 'kubectl apply -f deployment-green.yaml'
            }
        }

        stage('Switch Traffic') {
            steps {
                input 'Switch to Green?'

                sh '''
                kubectl patch service myapp-service \
                -p '{"spec":{"selector":{"app":"myapp","color":"green"}}}'
                '''
            }
        }
    }
}
