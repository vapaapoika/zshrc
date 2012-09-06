#################################
#                               #
#        afterpc's zshrc        #
#   http://github.com/afterpc   #
#                               #
#################################

#  Change $PS1
PS1="%n@%M %* %~ $ "

#  aliases
alias emacs='emacs -nw'
alias cputemp='acpi -t | cut -d"
" -f1 | cut -d" " -f4 | cut -d. -f1'
alias memfree='free -m | cut -d"
" -f2 | tr -s " " | cut -d" " -f4'
alias old='cd "$OLDPWD"'
alias c='clear'
alias ز='clear'
alias ll='ls -l'
alias grep='grep --color'
alias egrep='egrep --color'

#  Changing rm, mv & cp commands
alias rm='rm -vi'
#alias mv='mv -v'
alias cp='cp -v'
alias k3b='sudo k3b'

#  Make ls colory
alias ls='ls --color=auto'

#  Play favorite musics
alias pf='mplayer -shuffle $(find /media/My\ desktop/My\ desktop/music/music\ 1/Selena\ Gomez/ -iname "*.mp3") $(find /media/My\ desktop/My\ desktop/music/music\ 1/Avril\ Lavigne/ -iname "*.mp3")'

#  Functions
function cpusage() {
    num=0
    for p in `ps -Ao "%C" | grep -vi "cpu" | tr -d " "`; do
	num=`echo $num+$p | bc`
    done
    echo "$num"
    unset num
}

function cdm() {
    if [ ! -d /media/cdrom ]; then
	sudo mkdir /media/cdrom
    fi
    sudo mount /dev/sr0 /media/cdrom
}

function flashm() {
    if [ ! -d /media/flash\ memory ]; then
	sudo mkdir /media/flash\ memory
    fi
    sudo mount /dev/sdb1 /media/flash\ memory
}

function uflashm() {
    sudo umount /dev/sdb1
}

#function mv() {
#    if [ ! -f "$1" -a ! -d "$1" ]; then
#	echo "mv: cannot stat '$1': No such file or directory"
#    elif [ -d "$1" ]; then
#	/bin/mv -v "$1" "$2"
#    else
#	if [ -d "$2" ]; then
#	    to="$2/`python -c "s='$1';print s.split('/')[-1]"`"
#	else
#	    to="$2"
#	fi
#	if [ -f "$to" ]; then
#	    read -p "'$to' file exist! Do you want to do it? [y/N] " an
#	else
#	    an="y"
#	fi
#	if [ "`echo $an | tr [:upper:] [:lower:]`" = "y" ]; then
#	    /bin/mv -v "$1" "$to"
#	fi
#    fi
#}

function headv() {
    if [ $# -gt 1 ]; then
	tac "$2" | head "$1" | tac
    else
	tac "$1" | head | tac
    fi
}

function trim() {
    python -c "print ('$*').strip()"
}

# Write "So... Nothing! I'm here!"
s=""
for ((i=0; i<`echo $COLUMNS/2-13 | bc`; i++)); do
    s="${s}."
done
s="${s} So... Nothing! I'm here! "
for ((i=0; i<`echo $COLUMNS/2-13 | bc`; i++)); do
    s="${s}."
done
if [ ${#s} -ne $COLUMNS ]; then
    s="${s}."
fi
echo "${s}"