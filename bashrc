export EDITOR='mvim -f'

source ~/.bash/path
source ~/.bash/ps1
source ~/.bash/aliases
source ~/.bash/docker

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi
