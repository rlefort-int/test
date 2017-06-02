node('DOCKER_EL7_JDK') {
    
    stage('checking repo for new branch') {
         
        sh "
        mkdir Jenkins
        cd Jenkins
        git clone -b Jenkins https://github.com/rlefort-int/test.git
        cd test
        git ls-remote --heads https://github.com/rlefort-int/test > branches_latest
        
        if ! cmp -s branches_list branches_latest; then
            mv branches_latest branches_list
            echo "Files differ so a branch has been created or removed -> Triggering build"
            git commit -am "Build Triggered"
        fi"
    }




}
