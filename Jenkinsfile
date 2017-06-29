node('jenkins-slave-docker') {

  stage('checking repo for new branch') {
    sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
    sh '''if ! cmp -s branches_list branches_latest; 
               then 
                 echo "things changed"
                 mv branches_latest branches_list
                 branchesyes
	       else
                 branches=no	
 	  fi'''
}
  stage('building vms') {
    sh '''
      if [$branches == yes]
        echo "BRANCHES CHANGES" 
      '''
  }
}
