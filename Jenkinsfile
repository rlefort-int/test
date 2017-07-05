node('jenkins-slave-docker') {

  stage('checking repo for new branch') {
    
    sh'''git ls-remote --heads https://github.com/rlefort-int/test > branches_latest'''
    
    sh "scp -i /home/jenkins/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no jenkins-node@rl-jenkins2:/home/jenkins-node/branches_list /home/jenkins/workspace/test/"
    
    sh '''
	if ! diff -q branches_list branches_latest; 
               then 
                 echo "things changed"
                 mv branches_latest branches_list
	         echo "yes" > branches
	       else
                echo "things have not changed" 
 	  fi'''
}
  stage('building vms and updating branches_list') {
    sh '''
      branches=$(cat branches)
      if [ -n "$branches" ]; 
	then
          echo "BRANCHES CHANGES"
	  git ls-remote --heads https://github.com/rlefort-int/test > branches_list
	  scp -i /home/jenkins/.ssh/id_rsa -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no branches_list jenkins-node@rl-jenkins2:/home/jenkins-node/
          
          git clone -b vagrant https://github.com/rlefort-int/test
	  cd /home/jenkins/workspace/test/test
	  /home/jenkins/sedpass.sh
	  chmod -R 777 /home/jenkins/workspace/test/test
	  whoami
	  ./callvgrnt.sh
	  sudo vagrant up           
	  sudo vagrant destroy



	else 
	  echo "ideally jenkins already failed this script" 
      fi
      '''
  }
}
