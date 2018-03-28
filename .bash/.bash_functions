# Frequently-Used Directory Shortcuts
function d { cd /www/development/jjd/$1; }
function s { cd /www/stage/$1; }
function p { cd /www/production/$1; }

# Make Directory & Move into it
function mkcdr() { mkdir -p $1 && cd $1; }

# Recursively Give Web Permissions to a Directory
function http-permissions() {
    system -i "CHGAUT OBJ('${1}') USER(QTMHHTTP) DTAAUT(*RWX) OBJAUT(*ALL) SUBTREE(*ALL)"
}

# Update ConEmu Tab Title
function tt {
    echo -ne "\033]0;"$HOSTNAME"\007"
}

# IBM i DB2 alias
function db2() {
    echo "Running $1";
    system -i "call QSYS/QZDFMDB2 parm('$1')";
}

# Extract Compressed Files
function extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1 ;;
            *.tar.gz)    tar xzf $1 ;;
            *.bz2)       bunzip2 $1 ;;
            *.rar)       rar x $1 ;;
            *.gz)        gunzip $1 ;;
            *.tar)       tar xf $1 ;;
            *.tbz2)      tar xjf $1 ;;
            *.tgz)       tar xzf $1 ;;
            *.zip)       unzip $1 ;;
            *.Z)         uncompress $1 ;;
            *.7z)        7z x $1 ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

function ask() {
    # http://djm.me/ask
    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question - use /dev/tty in case stdin is redirected from somewhere else
        echo -en "$1 $GREEN($prompt)$RESET "
        read REPLY </dev/tty

        # Default?
        if [ -z "$REPLY" ]; then
            REPLY=$default
        fi

        # Check if the reply is valid
        case "$REPLY" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}
