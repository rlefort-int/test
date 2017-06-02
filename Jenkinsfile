node('DOCKER_EL7_JDK') {
    
    stage('checking repo for new branch') {
        
        git branch: 'Jenkins', url: 'https://github.com/rlefort-int/test/'
        
        sh "git ls-remote --heads https://github.com/rlefort-int/test > branches_latest
        
        if ! cmp -s branches_list branches_latest; then
            mv branches_latest branches_list
            echo "Files differ so a branch has been created or removed -> Triggering build"
            git commit -am "Build Triggered"
        fi"
    }




}
