# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -lF"

# xoxlov: aliases for good operationing
alias x="exit"
alias ..="cd .."
alias cd.="cd .."
alias cd..="cd .."
alias sl="ls"
alias cl="clear"
alias brc="nano ~/.bashrc"
alias tm="tmux attach || tmux -2 new"
alias tmx="${HOME}/.tmux/tmx.sh"
alias tmw="${HOME}/.tmux/tmw.sh"
alias update="sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y"
alias updatemore="sudo apt install -y $(apt list --upgradable 2>/dev/null | sed -n 's,/.*,,p')"
alias install="sudo apt install"
alias dc="doublecmd &"
alias h="history"
alias hh="history | egrep -i --color=auto"
alias hgrep="history | grep"
alias path="echo -e ${PATH//:/\\n}"
alias ports='netstat -tulanp'
alias ccat='highlight --out-format=ansi'
alias bat='batcat'

# xoxlov: https://ru.wikibooks.org/wiki/Настольная_книга_по_Linux
# Поиск запущеных приложений по имени
alias psgrep='ps aux | grep --color=auto $(echo "$1" | sed "s/^\(.\)/[\1]/g")'
# alias psgrep='ps aux | egrep -i --color=auto'

## Список отсортированных по размеру директорий в текущей рабочей директории
#alias dirsz='du -s `pwd`/* | sort -nr | cut -f 2- | while read a; do du -sh "$a"; done'
#
## Открыть доступ к директории через HTTP-сервер в библиотеке Python.
## Сервер слушает порт 8000.
#alias sharethis='python -m SimpleHTTPServer'

# Пинг публичного dns-сервера
alias p='ping 8.8.8.8 -A'

## Выводит внешний IP-адрес вашего интернет-шлюза
#myip(){ lynx --dump 2ip.ru | egrep -o '([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}' | uniq; }
## или
#myip(){ curl -s checkip.dyndns.org | sed 's/[^0-9.]//g'; }
## или
#myip(){ curl ifconfig.me; }
#
## Убить процессы по имени исполняемого файла
#ki() {
#   [[ $1 = '' ]] || [[ $1 = '-h' ]] || [[ $1 = '--help' ]] && echo "usage: $0 <program1..programN>" && return 1
#   for process in $*; do
#	  { kill -9 `pidof $process` 2>/dev/null && echo "$process" killed; } ||
#	  { echo $process not found: seems like nothing to kill; }
#   done
#}
#
## Вывести файл без комментариев и пустых строк
## Пример: gr /etc/fstab
#gr(){ egrep -v '^#|^$' "$1"; }
#
## Генерирование 10-и запоминаемых восьмизначных паролей (pwgen -B 8 10), c цифрами (-n), с буквами из верхнего регистра (-с), и вычислить MD5-хеш к нему.
#alias pwg='pwgen -cnB 8 10 | while read PASS; do echo -n -e "$PASS\t"; echo -n "$PASS" | md5sum | cut -f1 -d" "; done'


# xoxlov: работа с памятью и процессами
alias meminfo='free -m -l -t'
# Показать процессы, потребляющие больше всего памяти
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# find out the high memory consumption processes in order:
alias topmem="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -10"
# Показать процессы, использующие процессор:
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# find out the high CPU usage processes in order:
alias topcpu="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -10"

# Правильное отображение данных для free, df и du:
alias df='df -H'
alias du='du -ch'
alias free='free -h'

# Продолжать незавершенную загрузку по умолчанию
alias wget='wget -c'
# rsync
# -a for the archive to preserves ownership, permissions, etc.
# -v for verbose
# -h for human-readable
# -W for copying whole files only
# --no-compress as there is no lack of bandwidth between local devices
# --progress to see the progress of large files
# --info=progress2 to see the overall progress
# source directory path
# destination directory path
alias rsync="rsync -avhW --inplace --no-whole-file --progress --info=progress2"

# xoxlov: network
# ssh operations
alias sshi="ssh -i ~/.ssh/buildbox.pem "
alias scpi="scp -i ~/.ssh/buildbox.pem "
# iptables
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

# xoxlov: git operations
alias ga="git add"
alias gm="git commit -m"
alias gs="git status"
alias gl="git log --pretty=format:\"%H %an [%as] %s\" --graph"
alias rebase="git pull --rebase upstream master"

# add bash-git-prompt to the system
if [ ! -d ~/.bash-git-prompt ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
fi;

# ---- bash-git-prompt settings
# Set config variables first
GIT_PROMPT_ONLY_IN_REPO=1
# uncomment to avoid fetching remote status
GIT_PROMPT_FETCH_REMOTE_STATUS=0
# uncomment to show upstream tracking branch
GIT_PROMPT_SHOW_UPSTREAM=1
# can be no, normal or all; determines counting of untracked files
GIT_PROMPT_SHOW_UNTRACKED_FILES=all
# uncomment to avoid printing the number of changed files
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
# uncomment to support Git older than 1.7.10
#GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh
# uncomment for custom prompt start sequence
#GIT_PROMPT_START=...
# uncomment for custom prompt end sequence
#GIT_PROMPT_END=...

# as last entry source the gitprompt script
# use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
GIT_PROMPT_THEME=Custom
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
# use theme optimized for solarized color scheme
GIT_PROMPT_THEME=Solarized
source ~/.bash-git-prompt/gitprompt.sh
# ---- end of bash-git-prompt section
