node {
    stage('Checkout SCM'){
        checkout scm
    }

    if (env.TAG_NAME ==~ /\d+\.\d+\.\d+/){
        tag_number = env.TAG_NAME
        println ("Tag Number = " + tag_number)
    }
}