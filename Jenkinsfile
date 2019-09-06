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

                sh "gem istall capybara:3.10.0"

                sh "gem rspec:3.8.0"


            }
        }
        stage("Tests") {
            steps {
                sh "rspec --tag @testes"

                
            }



        }

    }











}