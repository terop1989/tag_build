node {
    stage('Checkout SCM'){
        checkout scm
    }

    if (env.TAG_NAME ==~ /\d+\.\d+\.\d+/){
        tag_number = env.TAG_NAME
        println ("Tag Number = " + tag_number)

        DockerRepositoryAddress='docker.io'
        DockerImageName='ubi8-php-fpm'
        DockerImageTag=tag_number

        stage('Build Docker Image') {
            withCredentials([usernamePassword(credentialsId: 'dockerhub_ykozhin', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASSWORD')]) {
                sh """
                    docker login ${DockerRepositoryAddress} -u $DOCKER_USER -p $DOCKER_PASSWORD
                    docker build -t ${DockerRepositoryAddress}/${DOCKER_USER}/${DockerImageName}:${DockerImageTag} .
                    docker push     ${DockerRepositoryAddress}/${DOCKER_USER}/${DockerImageName}:${DockerImageTag}
                """
            }
        }
    }
}