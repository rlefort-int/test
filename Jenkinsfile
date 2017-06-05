node('jenkins-slave') {
    stage('checking repo for new branch') {
         
        sh "cd /home/jenkins-slave/"
        sh"git ls-remote --heads https://github.com/rlefort-int/test > branches_latest"
        
        sh"if ! cmp -s branches_list branches_latest; then mv branches_latest branches_list; echo "Files differ so a branch has been created or removed -> Triggering build" fi"
    }
}
