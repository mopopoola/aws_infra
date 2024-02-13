pipeline {
    agent any
   
    environment {
        AWS_ACCESS_KEY_ID = credentials('KOLLY.AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('KOLLY.AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "eu-west-2"
    }
    stages {
        stage('Checkout') {
            steps {
           git branch: 'main', url: 'https://github.com/mopopoola/aws_infra.git'
  
            }
        }
    
        stage ("terraform init") {
            steps {
                sh "terraform init --migrate-state" 
            }
        }
  
        stage ("plan") {
            steps {
                sh "terraform plan" 
            }
        }
        stage (" Action") {
            steps {
                sh 'terraform ${action} --auto-approve' 
           }
        }
        stage("Deploy to EKS") {
            when {
               expression { params.apply }
            }
            steps {
                  sh "aws eks update-kubeconfig --name mopops1_cluster"
                   sh "kubectl apply -f deployment.yml"
             }
        }
    }
}
   
    
