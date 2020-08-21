#! /usr/bin/zsh

# Just a helper function that prints the help messages and exits the program
function help() {
    echo "Usage: create [project_name] [-m:message -> string] [-v:public_visibility -> t] [-p:path: project directory]"
}

function test_create() {
    # Usage: Usage: create [project_name] [-m:message -> string] [-v:public_visibility -> t] [-p:path: project directory] 

    # Variables
    ARGS=""
    project_name="untitled"         # Defaults to 'untitled'
    message='default message'       # Defaults to 'default message'
    public_visibility='f'           # Defaults to 'f' if -v is not specified
    directory='.'                   # Defaults to '.'
    ssh_url=''

    # Reinitializes the variables based upon the arguments given
    while [ $# -gt 0 ]
    do
        OPTIND=0
        while getopts "vhm:p:" opt; do
            project_name=${@:$OPTIND:1}
            case ${opt} in
            m   ) # Sets the message to the message added in CLI Args
                if [ -z $OPTARG ]; then
                else
                    message=$OPTARG 
                fi  
            ;;
            v   ) public_visibility='t'
            ;;
            p   ) # If path provided is incorrect then the program exits
                if [ -z $OPTARG ]; then
                else
                    if [ -d $OPTARG ]; then
                        directory=$OPTARG
                    else 
                        exit 1
                    fi
                fi
            ;;
            h   ) help; return;
            ;;
            \?  ) help; return;
            ;;
            *   ) help; return;
            ;;
        esac
        done

        shift $(( OPTIND - 1 ))
        ARGS="${ARGS}$1"
        shift
    done

    # Then clears the screen
    clear 
    Reassigns the project name
    project_name=$ARGS

    # Moves to the specified directory
    cd directory
    # Makes a directory with the project's name
    mkdir $project_name
    # Moves to that directory
    cd $project_name

    # Runs the Python Script that does the following
        # Creates a repository based on your Github Account with properties defined in CLI Arguments
        # Then it returns the SSH_URL so that it can be used for furthur setup and declaring git --upstream origin 
        
    # Creates a README.md file
    echo "# TODO" >> README.md

    ssh_url=$(python3 ./../create_project.py $project_name $message $public_visibility)

    # Initializes the directory as a git repository
    git init
    # Adds README.md to the tracking files list
    git add README.md
    # Does the inital commit to local machine
    git commit -m "initial commit [AUTO GEN]"
    # Adds the SSH_URL as origin for furthur ease
    git remote add origin $ssh_url
    # Pushes the local repository to Github
    git push -u origin master

    # Clears the Screen
    clear

    # Opens your favourite Text Editor in the project directory
    code .
}
