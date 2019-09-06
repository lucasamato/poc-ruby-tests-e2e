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

                source "https://rubygems.org"

gem "install bundler", "2.0.2"
gem "capybara", "3.10.0"
gem "rspec", "3.8.0"
            }
        }
        stage("Tests") {
            steps {
                sh "rspec --tag @testes"

                
            }



        }

    }











}