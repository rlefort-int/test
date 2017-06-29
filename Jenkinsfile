node('jenkins-slave-docker') {

  stage('checking repo for new branch') {
    sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
    sh '''
	git clone -b branches https://github.com/rlefort-int/test
	if ! cmp -s branches_list branches_latest; 
               then 
                 echo "things changed"
                 mv branches_latest branches_list
	         echo "yes" > branches
	       else
                 echo "no" > branches
 	  fi'''
}
  stage('building vms') {
    sh '''
      branches=$(cat branches)
      if ["$branches" -eq "yes"]; 
	then
          echo "BRANCHES CHANGES"
	else 
	  echo "No Branch Changes" 
      fi
      '''
  }
}
