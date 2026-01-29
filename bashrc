# Keep oodles of command history
HISTFILESIZE=-1
HISTSIZE=1000000
shopt -s histappend

# Set up personal aliases, functions, etc.
export PATH=$PATH:~/repos/osandov-linux/bin

export EDITOR=vim

function git-branch-name() {
	local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

	if [ -z "$branch" ]; then
		echo ""
		return
	fi

	if [ $? -eq 0 ]; then
		# Split the branch name by '/' and print only the part after the second '/'
		local parts=(${branch//\// })
		if [ ${#parts[@]} -gt 2 ]; then
			echo " (${parts[@]:2})"
		else
			echo " ($branch)"
		fi
	else
		echo ""
	fi
}

function slproml {
	export PS1='\[\033[1;34m\][hahn:\w\[\033[38;5;219m\]$(git-branch-name)\[\033[1;34m\]]\$\[\033[0m\] '
	PS2='> '
	PS4='+ '
}
slproml

# kernel aliases
alias runvm="vm.py run MyVM -k ~/local/linux"
alias hkml="~/local/repos/hackermail/hkml"
alias makek="make -j$(nproc) tar-pkg 2>&1 1>stdout.log | tee stderr.log; tail -n 1 stdout.log"

# vim aliases
alias vimr="vim -R"

# tmux aliases
alias attach="tmux attach"
alias detach="tmux detach"

# git aliases
alias gl="git log --oneline"
alias gs="git show"
alias gd="git diff"
