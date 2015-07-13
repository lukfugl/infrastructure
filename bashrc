export EDITOR='mvim -f'

source ~/.bash/path
source ~/.bash/ps1
source ~/.bash/aliases
source ~/.bash/docker

if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home'
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
