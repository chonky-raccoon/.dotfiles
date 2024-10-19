# Created by newuser for 5.9
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then 
	exec Hyprland > /dev/null 2>&1
fi

alias ll='ls -Al --group-directories-first --si --color=auto'
alias ls='ls --color=auto'

alias update='yay -Syu --devel && yay -Rns $(yay -Qdtq)'

alias gs='git status'

# Correct Delete key binding
bindkey "^[[3~" delete-char







eval "$(starship init zsh)"


neofetch
echo "		Welcome to Arch Linux. Remember your daily update."
       
