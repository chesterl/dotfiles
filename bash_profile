export PATH=/usr/local/bin:"$PATH"

eval "$(rbenv init -)"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# PATH=$PATH:/usr/local/Cellar/postgresql/9.6.5/bin/psql


function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$"

source ~/.alias
source ~/.bashrc


# added by Anaconda3 2019.03 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<


export PRISM_KEY="39918bf3-a1b6-4395-af6f-4bede01191f4"
export PRISM_SECRET="93120294-23ed-42a7-b4bf-d941714978ad"
export PRISM_BACKEND_AUTH="990B484E-C2A1-481A-802B-2E7F87430702"
export PATH=/usr/local/opt/mysql@5.7/bin:"$PATH"
export PATH=/Users/chesterl/.local/bin:"$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if [[ ! -S ~/.gnupg/S.gpg-agent && ! -n "$(pgrep gpg-agent)" ]]; then
  eval $(eval $(gpg-agent --daemon --options ~/.gnupg/gpg-agent.conf))
fi
