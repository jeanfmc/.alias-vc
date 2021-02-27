              ________  ___       ___  ________  ________           ___      ___ ________     
             |\   __  \|\  \     |\  \|\   __  \|\   ____\         |\  \    /  /|\   ____\    
             \ \  \|\  \ \  \    \ \  \ \  \|\  \ \  \___|_        \ \  \  /  / | \  \___|    
              \ \   __  \ \  \    \ \  \ \   __  \ \_____  \        \ \  \/  / / \ \  \       
               \ \  \ \  \ \  \____\ \  \ \  \ \  \|____|\  \        \ \    / /   \ \  \____  
                \ \__\ \__\ \_______\ \__\ \__\ \__\____\_\  \        \ \__/ /     \ \_______\
                 \|__|\|__|\|_______|\|__|\|__|\|__|\_________\        \|__|/       \|_______|
                                                   \|_________|                               

It's a alias to be added in your bash. \
Using the same commands for version controllers from different compilers.

### How to install:
Install the third parties necessary and clone the alias-vc repository using the command below:
```shell
git clone https://github.com/jeanfmc/.alias-vc.git ~/.alias-vc
```
After that change the bash profile file adding the lines below:
```shell
#Alias VC
export VC_PATH=~/.alias-vc
source "$(echo $VC_PATH)/alias-vc.sh"
```
__Bash profile file:__
* Windows: *~/.bashrc*
* Linux or MAC: *~/.bash_profile*


### Third Parties:
* SDK Man <https://github.com/sdkman/sdkman-cli>
* PyEnv <https://github.com/pyenv/pyenv>
* NVM <https://github.com/nvm-sh/nvm>
