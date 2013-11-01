export EDITOR='mvim -f'

source ~/.bash/path
source ~/.bash/ps1
source ~/.bash/aliases

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

source /opt/boxen/env.sh
