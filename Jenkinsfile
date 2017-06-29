node('jenkins-slave-docker') {

  stage('checking repo for new branch') {
    sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
    sh '''if ! cmp -s branches_list branches_latest; 
               then 
                 echo "things changed"
                 mv branches_latest branches_list
                 branches=yes
	       else
                 branches=no	
 	  fi'''
}
  stage('building vms') {
    sh '''
      if [$branches == yes]; 
	then
          echo "BRANCHES CHANGES"
	else 
	  echo "No Branch Changes" 
      '''
  }
}
