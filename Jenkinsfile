pipeline{
    agent {
        docker {
            image "ruby"
        }
    }
    stages {
        stage("Build"){
            steps {
                sh "gem install bundler:2.0.2"
            }
        }
        stage("Tests") {
            steps {
                sh "rspec --tag @testes"

                
            }



        }

    }











}