# Bash and Python Project
#### Project Template Generator

## Usage: 
```create <Project Name> [-optional -m <Message> -v <Visibility Public> -p <Project Path>]```

*If the project path is incorrect then current working directory will be chosen*

## Overview: 
This command allows you to create a project folder in any given directory on your Linux/Mac machine. Alongside making a directory it does the following.
- It initializes your porject folder as a git repository `git init`.
- It creates a `Github Repository` with the same name as your `Project Name` with the inital message being your optional message and visibility as provided by the user.
- It creates a `README.md` file and does the inital commit for your project on `Github`.

## Installation:
1. Download the files place them both in the ~ directory
2. Go into the your shell's `rc` default config file   (Usally its `.bashrc`). 
3. Add `source ./script.sh` at the end of the config file. 
4. Add an environment variable called `github_token` in the same shell config file. (`export $github_token="<Your Github Token>"`)
5. Install Python3
6. Setup an SSH Key for your github account so that you can remotely pull and push code to your repositories. Chances are it'll already be configured if you've been using github through terminal.
8. In case of skipping of any step may result in Error and breaking of program
   
## Resources for Installation:
- [Setting Up SSH Key](https://docs.github.com/en/enterprise/2.13/user/articles/adding-a-new-ssh-key-to-your-github-account)
- [Getting Github Authorization Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

### Specifics:
1. This project incorporates both `Python` and `Bash Scripting`
2. This code is completely open source. I've tried my best to comment the code so anyone making modifications can feel at home.

### Contact:
- Email: obsidianic18k@gmail.com