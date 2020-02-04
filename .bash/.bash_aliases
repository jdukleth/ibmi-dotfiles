# Reload BASH Configuration
alias reload="source ${HOME}/.bashrc"

# Directory Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Display Files with Syntax Coloring (requires python-pygments)
# sudo apt-get install python-pygments
alias ccat='pygmentize -O style=monokai -f console256 -g'

# List Files with More Detail by Default
# use this when we figure out color & option h
# alias ls='ls -Alh --color=always'
alias ll='ls -al'

# Log & Config Shortcuts
alias phplog='tail -f -n 200 /usr/local/zendphp7/var/log/php.log'
alias phpini='nano /usr/local/zendphp7/etc/php.ini'

# pm2
alias ipm2='env HOME=/www pm2'
alias ipm2start='env HOME=/www pm2 start /www/ecosystem.config.js'

# run SQL from bash
# https://github.com/IBM/ibmi-db2util
export DB2UTIL_JSON_CONTAINER=array
alias db2='db2util -o json'

