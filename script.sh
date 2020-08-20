# Prints the CWD
function create {
    # Usage: create <str:Project/Repo Name> <str:Description> 

    # Variables
    project_name=$1 # First CLI Arg
    project_description=$2 # Second CLI Arg

    cd ~/Desktop
    mkdir $project_name
    cd $project_name
    ssh_url=$(python3 ~/create_project.py $project_name $project_description)
    
    # Git Commands
    echo "# TODO" >> README.md
    git init
    git add README.md
    git commit -m "initial commit [AUTO GEN]"
    git remote add origin $ssh_url
    git push -u origin master
}
