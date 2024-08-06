pipeline {
    agent any
    parameters {
                 choice choices: ['apply', 'destroy'], name: 'action'
                }

    stages {
        stage("aws credentials") {
	    steps {
		withCredentials([aws(accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws-credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY')]) {
    		sh 'aws s3 ls'
		}
	}
	}
        stage("terraform init") {
            steps {
                sh 'terraform init'
                }
        }
        stage("terraform validate") {
            steps {
                sh 'terraform validate'
                }
        }
        stage("terraform plan") {
            steps {
                sh 'terraform plan'
                }
        }
        stage("terraform apply&destroy") {
            steps {
                sh 'terraform ${action} --auto-approve'
                }
        }
   }
}
