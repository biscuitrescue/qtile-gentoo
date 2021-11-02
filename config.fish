set -x EDITOR nvim
set fish_greeting
set -x MANPAGER "nvim -c 'set ft=man' -"
set TERM "xterm-256color"

set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command '#5aec79'
set fish_color_error '#ff6c6b'
set fish_color_param brcyan


fish_vi_key_bindings

alias ll='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ls='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
alias vim='nvim'
alias timetable='python3 $HOME/python/timetable.py'
alias reboot='loginctl reboot'
alias poweroff='loginctl poweroff'
alias bstart='startx /usr/bin/bspwm'
alias dstart='startx /usr/local/bin/dwm'
alias clone='git clone'
alias rclear='clear && colorscript -e 32'
alias compdir='sshfs karttikeya@192.168.1.15:/home/karttikeya ~/sshfs'
# alias tmpkernel='doas mount -t tmpfs -o size=24G,mode=775,nosuid,noatime,nodev tmpfs ~/kernel/tmpkernel/'

# echo
# neofetch
rxfetch
# echo
# echo
# # colorscript -e 32
# echo
# echo
python3 $HOME/python/timetable.py
