    
    stage('checking repo for new branch') {
         
        sh "
        git clone -b Jenkins https://github.com/rlefort-int/test.git
        cd test
        git ls-remote --heads https://github.com/rlefort-int/test > branches_latest
        
        if ! cmp -s branches_list branches_latest; then
            mv branches_latest branches_list
            echo "Files differ so a branch has been created or removed -> Triggering build"
            git -c user.name='Reilly LeFort' -c user.email='rlefort@interset.com' commit -am 'BUILD TRIGGERED as branches changed'
            git -c user.name='Reilly LeFort' -c user.email='rlefort@interset.com' push         
        fi"
    }
