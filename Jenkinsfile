pipeline{
    agent {
        docker {
            image "ruby:alpine"
        }
    }
    stages {
        stage("Build"){
            steps {
                sh "chmod +x build/alpine.sh"
                sh "./build/alpeine.sh"
                sh "bundle install"
               


            }
        }
        stage("Tests") {
            steps {
                sh "bundle exec rspec --tag @testes"

                
            }



        }

    }











}