node('jenkins-slave-docker') {

  stage('checking repo for new branch') {
    sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
       sh '''if ! cmp -s branches_list branches_latest; 
               then 
                 echo "things changed"
                 mv branches_latest branches_list
                 echo "yes" > build.properties
               else
                 echo "no" > build.properties
               fi '''
environment { branches_changed = readFile 'build.properties' }
 echo "branches_changed"
 }
}
