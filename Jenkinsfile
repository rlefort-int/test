node('jenkins-slave') {
    stage('checking repo for new branch') {
         
        sh "cd /home/jenkins-slave/"
        sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
        sh '''      if ! cmp -s branches_list branches_latest; 
                        then 
                        echo "things changed"
                        mv branches_latest branches_list
                        cd /home/jenkins-slave/workspace/test/vagrant
                        git clone -b vagrant --single-branch https://github.com/rlefort-int/test 
                        cd /home/jenkins-slave/workspace/test/vagrant/test/
                        chmod +x /home/jenkins-slave/workspace/test/vagrant/test/callvgrnt.sh
                        /home/jenkins-slave/workspace/test/vagrant/test/callvgrnt.sh
                        cd /home/jenkins-slave/workspace/test/vagrant/test 
                        vagrant up --provider=vsphere
                        rm -rf /home/jenkins-slave/workspace/test/vagrant/test
                    fi'''

        
    }
}
