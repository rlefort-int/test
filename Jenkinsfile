node('jenkins-slave') {
    stage('checking repo for new branch') {
         
        sh "cd /home/jenkins-slave/"
        sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
        sh '''      if ! cmp -s branches_list branches_latest; 
                        then 
                        mv branches_latest branches_list
                        cd /home/jenkins-slave/workspace/test/vagrant
                        git clone -b vagrant --single-branch https://github.com/rlefort-int/test 
                        mv  /home/jenkins-slave/workspace/test/vagrant/test/confignew  /home/jenkins-slave/workspace/test/vagrant
                        /home/jenkins-slave/workspace/test/vagrant/callvagrant 
                        vagrant up
                    fi'''

        
    }
}
